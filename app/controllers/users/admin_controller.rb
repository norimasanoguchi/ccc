class Users::AdminController < ApplicationController
  layout :select_layout
  before_action :company_account_block,only:[:index]
  before_action :authenticate_user!,only: [:index]

 def index
   @user = current_user
   @user ||= User.find_by(params[:id])
   @conversations = @current_user.conversations
 end

  def show
    user_or_company_login_check
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
    if user_signed_in?
      if params[:id].to_i != current_user.id.to_i
        redirect_to(root_path,notice:"異なるユーザーの情報は閲覧できません")
      else
        @user = User.find_by(id:params[:id])
      end
    elsif company_signed_in?
      @user = User.find_by(id:params[:id])
    else
      redirect_to(root_path,notice:"ログインしてください")
    end
  end
end
