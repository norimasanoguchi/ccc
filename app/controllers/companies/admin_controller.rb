class Companies::AdminController < ApplicationController
  before_action :authenticate_company!
  layout 'company_admin'

 def index
   @current_company = current_company
   @sexes = User.sexes
   @visas = Visa.all
   @edu_levels = User.edu_levels
   @jlpts = User.jlpts
   @Prefectures = Prefecture.all
   @chinese_skills = User.chinese_skills
   if params[:q].present?
     @q = User.ransack(search_params)
     @users = @q.result
   else
     @q = User.ransack(params[:q])
     @users = User.all.order(created_at: :desc)
   end
 end

  def show
    @current_company = current_company
  end

  def user_info
    @user = User.find_by(id:params[:id])
  end
end

private

def search_params
  params.require(:q)
    .permit(:name_cont,:email_cont,:tel_cont,:wechat_id_cont,
            :birthday_to_age_gteq,:birthday_to_age_lteq,:sex_eq,:prefecture_id_eq,
            :visa_id_eq,:edu_level_in,:jlpt_in,:chinese_skill_in,:s)
end