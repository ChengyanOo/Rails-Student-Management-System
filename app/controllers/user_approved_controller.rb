class UserApprovedController < ApplicationController
    # approve a user
    def approve
       User.find(params[:id]).approve
       # refresh page to reflect update
       redirect_to '/approve', notice: 'User Approved.'
    end

    def disapprove
        User.find(params[:id]).destroy
        # refresh page to reflect update
        redirect_to '/approve', notice: 'User Disapproved.'
    end
end
