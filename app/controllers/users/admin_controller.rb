class Users::AdminController < ApplicationController
  # before_action :authenticate_user!
  layout 'user_admin'

 def index
   authenticate_user!
   @current_user = current_user
   @conversations = @current_user.conversations
 end

  def show
    authenticate_user! unless company_signed_in?
    @user = User.find_by(id:params[:id])
  end
end
