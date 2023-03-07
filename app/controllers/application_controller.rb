class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_user!
    set_current_tenant_by_subdomain_or_domain(:organization, :subdomain, :domain)
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:plan])
    end

    def set_current_organization
        return unless current_user.present?
        current_organization = current_user.organization
        ActsAsTenant.current_tenant = current_organization
    end
end
