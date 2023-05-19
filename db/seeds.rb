require "httparty"

# Destroy all existing records to start fresh
StudentApplication.destroy_all
InstructorRecommendation.destroy_all
SectionInstructor.destroy_all
User.destroy_all
Section.destroy_all
Course.destroy_all

# Make an HTTP GET request to the API endpoint
response = HTTParty.get("https://content.osu.edu/v2/classes/search?q=Cse&client=class-search-ui&campus=col&term=1232&p=1&subject=cse")

# Parse the JSON response
classes = JSON.parse(response.body)

# Extract the courses data from the JSON
courses = classes["data"]["courses"]

# Method to separate the displayName into first and last name
def split_name(display_name)
  names = display_name.split(" ")
  first_name = names.shift
  last_name = names.pop
  [first_name, last_name]
end

# Helper method to count the number of days in a week that a section meets
def countNumDays(section)
  days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
  num_days = 0
  days.each do |day|
    if section["meetings"][0][day]
      num_days += 1
    end
  end
  return num_days
end

# Helper method to determine if a section is a laboratory
def isLab(section)
  if section["component"] == "Laboratory"
    return true
  end
  return false
end

# Loop through each course in the courses array
courses.each do |course_data|
  # Extract course information and create a new Course record
  course_info = [
    course_data["course"]["title"],
    course_data["course"]["catalogNumber"],
    course_data["course"]["description"],
    course_data["course"]["maxUnits"],
    course_data["course"]["catalogLevel"],
  ]
  course = Course.create(name: course_info[0], class_number: course_info[1], description: course_info[2], credit_hours: course_info[3], class_level: course_info[4])

  # Loop through each section in the course_data["sections"] array
  course_data["sections"].each do |section|
    if section["meetings"] && section["meetings"][0]
      # Extract section information and create a new Section record
      section_info = [
        section["meetings"][0]["startTime"],
        section["meetings"][0]["endTime"],
        countNumDays(section),
        section["secCampus"],
        section["termCode"],  #1232 for spring2023
        isLab(section),
        section["instructionMode"],
        0,
        section["meetings"][0]["monday"],
        section["meetings"][0]["tuesday"],
        section["meetings"][0]["wednesday"],
        section["meetings"][0]["thursday"],
        section["meetings"][0]["friday"],
        section["meetings"][0]["saturday"],
        section["meetings"][0]["sunday"],
      ]
      sec = course.sections.create(start_time: section_info[0], end_time: section_info[1], num_of_days: section_info[2], campus: section_info[3], term: section_info[4], is_lab: section_info[5], instructionMode: section_info[6], graders_needed: 1, monday: section_info[8], tuesday: section_info[9], wednesday: section_info[10], thursday: section_info[11], friday: section_info[12], saturday: section_info[13], sunday: section_info[14])

      section["meetings"][0]["instructors"].each do |instructor|
        if instructor["displayName"] && !instructor["displayName"].empty?
          # puts instructor["email"]
          first_name, last_name = split_name(instructor["displayName"])
          User.find_or_create_by!(email: instructor["email"], first_name: first_name, last_name: last_name) do |user|
            user.role = instructor["role"]
            user.password = "Defualt001!!!"
            user.is_approved = "false"
          end
        end
      end

      instructors = []
      ta_id = nil

      section["meetings"][0]["instructors"].each do |instructor|
        if ["PI", "GR"].include?(instructor["role"])
          temp_instructor = User.find_by(role: instructor["role"], email: instructor["email"])
          instructors << temp_instructor.id if !temp_instructor.nil?
        elsif instructor["role"] == "TA"
          temp_ta = User.find_by(role: "TA", email: instructor["email"])
          ta_id = temp_ta.id if !temp_ta.nil?
        end
      end
      puts "instructors"
      puts instructors
      puts "sec.id"
      puts sec.id
      puts "_________________________"
      instructors.each do |instruct_id|
        puts "instruct_id"
        puts instruct_id
        section_instructor = SectionInstructor.new(
          instructor_id: instruct_id,
          teaching_assistant_id: ta_id,
          section_id: sec.id,
        )

        if section_instructor.valid?
          section_instructor.save!
          puts "Created SectionInstructor:"
        else
          puts "SectionInstructor not created due to validation errors:"
          puts section_instructor.errors.full_messages
        end
        puts section_instructor.inspect
        puts "_________________________"
      end
    end
  end
end

User.create!({
  email: "admin.1@osu.edu",
  first_name: "first",
  last_name: "last",
  password: "notpassword",
  role: "Admin",
  is_approved: "true",
})
