class ApplicationController < ActionController::Base
  include Pagy::Backend
  set_current_tenant_by_subdomain(:organization, :subdomain)
end
