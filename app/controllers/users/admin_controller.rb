class Users::AdminController < ApplicationController
  layout :select_layout
  before_action :company_account_block,only: [:index]
  before_action :authenticate_user!,only: [:index]

 def index
   @user = current_user
   @user ||= User.find_by(params[:id])
   @conversations = @current_user.conversations
 end

  def show
    user_or_company_login_check
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
  
  def user_or_company_login_check
    unless user_signed_in? || company_signed_in?
       redirect_to(root_path,notice:"ログインしてください")
    end
  end
end
