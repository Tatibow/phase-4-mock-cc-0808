class ActivitiesController < ApplicationController
    #error handling
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


    #Read
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    #Delete
    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

     #private area
    private

    #error handling helpers
    def render_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

end
