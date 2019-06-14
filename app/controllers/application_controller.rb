class ApplicationController < ActionController::Base
    protected

    # def after_sign_in_path_for(resource_or_scope)
    #   if resource_or_scope == :user
    #     users_admin_index_path
    #   elsif resource_or_scope == :company
    #     companies_admin_index_path
    #   else
    #     root_path
    #   end
    # end

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        users_admin_index_path
      elsif  resource_or_scope.is_a?(Company)
        companies_admin_index_path
      else
        root_path
      end
    end

    def after_update_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        users_admin_index_path
      elsif  resource_or_scope.is_a?(Company)
        companies_admin_index_path
      else
        root_path
      end
    end

    def after_sign_up_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        new_user_session_path
      elsif  resource_or_scope.is_a?(Company)
        new_company_session_path
      else
        root_path
      end
    end

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :user
        root_path
      elsif resource_or_scope == :company
        companies_top_index_path
      else
        root_path
      end
    end

end
