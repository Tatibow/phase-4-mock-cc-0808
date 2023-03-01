class CampersController < ApplicationController
    #error handling
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

#Read
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok
    end

    #Create
    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    end

    #private area
    private

    #error handling helpers
    def render_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def render_record_invalid
        render json: {errors:["invalid record"]}, status: :unprocessable_entity
    end

    #camper params
    def camper_params
        params.permit(:name, :age)
    end
end
