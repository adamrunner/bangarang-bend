module ApplicationHelper

  def ftime(time)
    time = time.localtime
    time.strftime("%B %dth, %Y at %I:%M %p")
  end

  def ftime_short(time)
    time = time.localtime
    time.strftime("%m/%d/%y %I:%M %p")
  end

  def caps_first(string)
    string.split.map(&:capitalize).join(' ')
  end

  def breadcrumb_link(breadcrumb)
    controller = breadcrumb[0]
    action = breadcrumb[1]
    data_model = breadcrumb[2] ? breadcrumb[2] : nil

    if action === "index"
      name = controller.pluralize.titleize
      id = nil
    elsif action === "edit"
      name = "edit".titleize
      id = data_model.id
    else
      name = data_model.name.titleize
      id = data_model.id
    end
    link_to_unless_current(name, {controller: controller, action: action, id: id})
  end

end
