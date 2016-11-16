module Admin::PagesHelper

  def IG_authorized(status)
    if status === true
      content_tag(:b, "Authorized", class: "text-success")
    else
      content_tag(:b, "Unauthorized", class: "text-warning")
    end
  end

end
