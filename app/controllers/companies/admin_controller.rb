class Companies::AdminController < ApplicationController
  before_action :authenticate_company!

 def index
   @current_company = current_company
   # @users = User.all
   @sexes = User.sexes
   @visas = Visa.all
   @edu_levels = User.edu_levels
   @jlpts = User.jlpts
   @Prefectures = Prefecture.all
   @chinese_skills = User.chinese_skills
   @q = User.ransack(params[:q])
   @users = @q.result
 end

  def show
    @current_company = current_company
  end

  def user_info
    @user = User.find_by(id:params[:id])
  end
end
