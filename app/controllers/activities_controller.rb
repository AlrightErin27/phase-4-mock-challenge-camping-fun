class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_NF
  rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # GET /activities
  def index
    render json: Activity.all, status: :ok
  end

  # DELETE /activities/:id
  def destroy
    activity = Activity.find(params[:id])
    activity.destroy

    # render json: {}, status: :ok
    head :no_content
  end

  #------------------ 🤐 ------------------#
  private

  #--------------   ERRORS   --------------#
  def error_NF
    render json: { error: 'Activity not found' }, status: :not_found
  end

  def error_UE(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
