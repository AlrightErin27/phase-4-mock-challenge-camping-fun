class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # POST /signups
  def create
    signup = Signup.create!(signup_params)
    render json: signup.activity, status: :created
  end

  #------------------ 🤐 ------------------#
  private

  #--------------   ERRORS   --------------#
  def error_UE(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  #--------------    PARAMS    -------------#
  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
