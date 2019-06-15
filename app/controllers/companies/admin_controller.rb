class Companies::AdminController < ApplicationController
  before_action :authenticate_company!
  layout 'company_admin'

 def index
   @current_company = current_company
   @sexes = User.sexes
   @visas = Visa.all
   @edu_levels = User.edu_levels_i18n.invert
   @jlpts = User.jlpts_i18n.invert
   @Prefectures = Prefecture.all
   @chinese_skills = User.chinese_skills_i18n.invert

   if params[:q].present?
     @q = User.ransack(search_params)
     @q.build_sort if @q.sorts.empty?
     @users = @q.result
   else
     @q = User.ransack(params[:q])
     @q.build_sort if @q.sorts.empty?
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
    .permit(:name_cont,
            :email_cont,
            :tel_cont,
            :wechat_id_cont,
            :birthday_to_age_gteq,
            :birthday_to_age_lteq,
            :sex_eq,
            :sex,
            :prefecture_id_eq,
            :visa_id_eq,
            :s,
            edu_level_eq: {},
            jlpt_in: {},
            chinese_skill_in: {})
end