module Common_action
  extend ActiveSupport::Concern

  # メソッド
  def company_account_block
    redirect_to(companies_top_index_path,notice:"求職者、企業アカウント同時ログインはできません。")  if company_signed_in?
  end

  def user_account_block
    redirect_to(root_path,notice:"求職者、企業アカウント同時ログインはできません。")  if user_signed_in?
  end

  private

  # privateメソッド

end