class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    set_current_tenant_by_subdomain_or_domain(:organization, :subdomain, :domain)
    

    def set_current_organization
        return unless current_user.present?
        current_organization = current_user.organization
        ActsAsTenant.current_tenant = current_organization
    end
end
