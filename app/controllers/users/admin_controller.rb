class Users::AdminController < ApplicationController
  layout :select_layout

 def index
   authenticate_user! unless company_signed_in?
   @user = current_user
   @user ||= User.find_by(params[:id])
   @conversations = @current_user.conversations
 end

  def show
    authenticate_user! unless company_signed_in?
    @user = User.find_by(id:params[:id])
  end

  private
  def select_layout
    if company_signed_in?
      'company_admin'
    elsif user_signed_in?
      'user_admin'
    end
  end
end
