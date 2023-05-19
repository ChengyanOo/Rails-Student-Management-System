class RemoveUsersController < ApplicationController
    #Actions
    before_action :authenticate_user!

    def delete
        destroy_user_session_path(current_user)
        current_user.destroy
        # Go back to main page to reflect update
        redirect_to :root, notice: 'User Deleted.'
    end
end