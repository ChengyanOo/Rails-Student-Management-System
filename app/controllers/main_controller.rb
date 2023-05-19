class MainController < ApplicationController
    def index
        if user_signed_in?
            redirect_to course_view_path
        end 
    end
end