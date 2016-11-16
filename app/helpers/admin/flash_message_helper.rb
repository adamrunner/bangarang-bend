module Admin::FlashMessageHelper

  def render_flash(msg)
    data = msg.to_json
    javascript_tag("Bangarang.trigger( 'flashMessage', #{data} );")
  end

  def flash_helper
    return if !notice && !alert
    msg = { notice: notice } if notice
    msg = { alert: alert } if alert
    render_flash(msg)
  end

end
