class RecommendationsController < ApplicationController
  # NOTE: created a temp student whose email is tempdd.878@osu.edu!!
  # NOTE: instructors are PI/GR
  # NOTE: when calling this method, use the id of the InstructorRecommendation row, you can figure it out by show all StudentApplication rows
  def show
    # NOTE: no need to look at set up, just to create sample rows of tables
    # set up STARTS ******************************
    student = User.find_or_create_by(
      email: "tempdd.878@osu.edu",
      role: "Student",
    ) do |user|
      user.first_name = "first"
      user.last_name = "last"
      user.password = "notpassword"
    end

    instructor = User.find_by!(role: "PI", email: "grimme.16@osu.edu")
    student = User.find_by!(role: "Student", email: "tempdd.878@osu.edu")
    section = Section.find_by!(id: 2)

    student_application = StudentApplication.find_or_create_by(
      user_id: student.id,
      section_id: section.id,
    ) do |sa|
      sa.date = "blah"
    end
    # show all StudentApplication rows
    puts "StudentApplication.all"
    puts StudentApplication.all.inspect

    InstructorRecommendation.find_or_create_by(
        instructor_id: instructor.id,
        student_id: student.id,
        section_id: section.id
      ) do |recommendation|
        recommendation.date = "blah"
        recommendation.student_applied = true
      end
    # show all InstructorRecommendation rows
    puts "InstructorRecommendation.all"
    puts InstructorRecommendation.all.inspect

    # set up ENDS *********************************
    
    # NOTE: id 6 may not exist, use prompt above to figure out the right id.
    instructorRec = InstructorRecommendation.find_by!(id: 1)
    student_application_id = params[:student_application_id]
    recommendations = fetch_recommendations(student_application_id)
    redirect_to course_view_path
  end

  private
  def fetch_recommendations(student_application_id)
    recommendations = InstructorRecommendation.joins(
      "INNER JOIN student_applications sa ON instructor_recommendations.student_id = sa.user_id AND instructor_recommendations.section_id = sa.section_id"
    ).where("sa.id = ?", student_application_id)
    # inspect each recommendation
    recommendations.each do |recommendation|
        puts "recommendation: #{recommendation.inspect}"
    end
    recommendations
  end
end
