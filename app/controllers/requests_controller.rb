class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        current_user.requests << @request
        @request.update_attributes(active: true)
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def request_params
    params.require(:request).permit(:date, :notes, :user_ids => [])
  end
end
