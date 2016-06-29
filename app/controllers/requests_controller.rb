class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        current_user.requests << @request
        @request.update_attributes(active: true)
        format.html { redirect_to root_path, notice: 'Sub Request was successfully created.' }
      else
        format.html { render root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def claim
    @user = current_user
    @request = Request.find(params[:id])
    @sub_check = @request.users.where(substitute: true)
      unless @sub_check.count > 0
        @request.update_attributes(sub_claim: true)
        current_user.requests << @request
        respond_to do |format|
         format.html { redirect_to root_path, notice: 'Job Claimed' }
         end
       else
         respond_to do |format|
          format.html { redirect_to root_path, alert: 'Job has been claimed and is no longer available.' }
        end
      end
  end

  def unclaim
    @user = current_user
    @request = Request.find(params[:id])
    @sub_check = @request.users.where(substitute: true)
    @userrequest = Userrequest.where(user_id: current_user)
        @request.update_attributes(sub_claim: false)
        # remove @request from current_user.requests
        @userrequest.destroy_all
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Job Unclaimed' }
        end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'Sub Request was cancelled.' }
    end
  end

  private

  def request_params
    params.require(:request).permit(:date, :notes, :active, :user_ids => [])
  end
end
