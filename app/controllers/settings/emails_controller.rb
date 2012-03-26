class Settings::EmailsController < ApplicationController
  before_filter :require_login, :assing_curent_user

  def show
  end

  def update
    if @user.update_attributes(params[:user])
      message = @user.email.present? ? 'Send email to your address.' : nil
      redirect_to dashboard_path, notice: message
    else
      render action: 'show'
    end
  end

  private

  def assing_curent_user
    @user = current_user
  end
end