module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    render_flash({ alert: resource.errors.full_messages.first })

  end
end
