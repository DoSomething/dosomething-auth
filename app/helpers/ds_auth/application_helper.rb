module DsAuth
  module ApplicationHelper
    def authenticated?
      (session[:user_id] && session[:user_id].to_i > 0) && (session[:user_roles] && session[:user_roles].values.include?('authenticated user'))
    end

    def admin?
      authenticated? && session[:user_roles].values.include?('administrator')
    end

    def has_role? (roles)
      if roles.is_a? Array
        authenticated? && ((session[:user_roles].values & roles).length == roles.length)
      else
        authenticated? && session[:user_roles].values.include?(roles)
      end
    end
  end
end
