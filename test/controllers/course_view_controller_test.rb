require "test_helper"

class CourseViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_view_index_url
    assert_response :success
  end
end
