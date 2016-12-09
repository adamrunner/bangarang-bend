module Admin::PagesHelper

  def IG_authorized(instagram_auth)
    if instagram_auth.authorized === true
      status = "Authorized"
      span_one_em_class = "text-info"
      span_two_em_class = "text-success"
    else
      status = "Unauthorized"
      span_one_em_class = "text-warning"
      span_two_em_class = "text-warning"
    end

    span_one = content_tag :span, class: "lead page-ig-status" do
      concat("account:")
      concat(content_tag(:em, instagram_auth.username, class: span_one_em_class))
    end

    span_two = content_tag :span, class: "lead page-ig-status" do
      concat("status:")
      concat(content_tag(:em, status, class: span_two_em_class))
    end

    return span_one + span_two
  end

end
