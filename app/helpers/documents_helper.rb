module DocumentsHelper
  def bg_color
    current_tenant.present? ? current_tenant.background_color : ""
  end

  def tx_color
    current_tenant.present? ? current_tenant.text_color : ""
  end
end
