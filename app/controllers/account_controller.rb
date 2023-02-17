class AccountController < ApplicationController
  set_current_tenant_through_filter

  before_action :authenticate_user!
  before_action :set_current_organization

  layout "account"

  private

    def set_current_organization
      return unless current_user.present?
      ActsAsTenant.current_tenant = current_user.organization
    end
end
