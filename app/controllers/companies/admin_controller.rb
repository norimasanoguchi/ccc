class Companies::AdminController < ApplicationController
  before_action :authenticate_company!

 def index
   @current_company = current_company
   @users = User.all
 end

  def show
    @current_company = current_company
  end

  def user_info
    @user = User.find_by(id:params[:id])
  end
end
