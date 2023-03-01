class SignupsController < ApplicationController
    #error handling
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

    #for testing
    #  def index
    #     render json: Signup.all, status: :ok
    #  end

    #Create
    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup.activity, status: :created
    end

    #private area
    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

     #error handling helpers
     def render_record_invalid
        render json: {errors: ["invalid record"]}, status: :unprocessable_entity
    end
end
