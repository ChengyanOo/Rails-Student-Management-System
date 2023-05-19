class GraderAssignedController< ApplicationController
    # approve a user
    def assign
        @sect = Section.find(params[:section_id])
        @sect.update_attribute(:graders_needed, @sect.graders_needed-=1)
        StudentGrader.create({
            section_id: params[:section_id],
            user_id: params[:user_id]
        })
        StudentApplication.find(params[:user_id]).destroy
        redirect_to '/approve', notice: 'User Assigned.'
    end

    def deny
        StudentApplication.find(params[:user_id]).destroy
        redirect_to '/approve', notice: 'User Denied.'
    end
end