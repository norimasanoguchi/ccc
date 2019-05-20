class Users::UsersController < ApplicationController
  def index
  end

  # def new
  #   @user = User.new
  # end

#   def create
#     # @user = current_user.posts.build(post_params)
#     @user = User.new(user_params)
#     if @user.save
#       redirect_to users_path # TODO 推移先を登録完了通知ページに変更
#       # TODO 登録完了メール送る処理を書く
#       # ConfirmMailer.confirm_mail(@post).deliver
#     else
#       render 'new'
#     end
#   end
#
#   private
#   def user_params
#     params.require(:user).permit(:name, :birthday, :sex, :email, :email_confirmation, :tel, :wechat_id, :edu_level, :jlpt, :management, :chinese_skill, :visa_id, :prefecture_id)
#   end
end
