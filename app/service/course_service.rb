class CourseService
    def self.fetch_courses(semester_code)
      response = HTTParty.get("https://content.osu.edu/v2/classes/search?q=Cse&client=class-search-ui&campus=col&term=#{semester_code}&p=1&subject=cse")
      JSON.parse(response.body)
    end
  
    def self.count_num_days(section)
      days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
      num_days = 0
      days.each do |day|
        if section["meetings"][0][day]
          num_days += 1
        end
      end
      num_days
    end
  
    def self.is_lab(section)
      section["component"] == "Laboratory"
    end
  end