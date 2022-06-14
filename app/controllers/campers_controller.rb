class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_NF
  rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # GET /campers
  def index
    render json: Camper.all, status: :ok
  end

  # GET /campers/:id
  def show
    camper = Camper.find(params[:id])
    render json: camper, serializer: DetailedCamperSerializer, status: :ok
  end

  # POST /campers
  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :accepted
  end

  #------------------ 🤐 ------------------#
  private

  #--------------   ERRORS   --------------#
  def error_NF
    render json: { error: 'Camper not found' }, status: :not_found
  end

  def error_UE(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  #--------------   PARAMS   --------------#
  def camper_params
    params.permit(:name, :age)
  end
end
