class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:organization, :subdomain)
end
