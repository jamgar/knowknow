class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  set_current_tenant_by_subdomain(:organization, :subdomain)
end
