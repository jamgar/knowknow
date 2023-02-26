class ApiController < ApplicationController
  set_current_tenant_through_filter
  
  before_action :set_format
  before_action :set_current_organization

  private

    def set_current_organization
      authenticate_token!
      if @current_organzation
        ActsAsTenant.current_tenant = @current_organzation 
      end
    end

    def authenticate_token!
      @current_organzation = Organization.find_by(api_key: auth_token)

      if @current_organzation.blank?
        render json: { error: ["Missing or invalid auth token"]}, status: :unauthorized
      end
    end

    def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end

    def set_format
      request.format = :json
    end
end
