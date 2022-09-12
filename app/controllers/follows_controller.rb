class FollowsController < ApplicationController
    
    def new
        @follow = Follow.new
    end

    def show
        @follow= Follow.find(params[:id])
    end
    
    def create

        @follow = Follow.new(follow_params)
        
        if @follow.save
            flash[:success] = "Follow has been created succesfully"
            redirect_to root_path
        else
          render :new, status: :unprocessable_entity
          flash[:alert] = "Follow not created,Try again"
        end
    end


    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "Follow has been destroyed succesfully"
    end
    

    private
    def follow_params
        params.require(:follow).permit(:follower_user_id, :followed_user_id) 
    end
end
