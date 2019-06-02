class Companies::MypageController < ApplicationController
  before_action :authenticate_company!

 def index
   @current_company = current_company
   @users = User.all
 end

  def show
    @current_company = current_company
  end

end
