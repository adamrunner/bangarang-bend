crumb :root do
  link "Pages", admin_root_path
end

crumb :page do |page, tab|
  link page.name.titleize, admin_page_path(page, tab ? tab : "")
end

crumb :catering_menu do |model, type|
  if type && type === "edit"
    link "Edit", edit_admin_catering_menu_path(model)
    parent :catering_menu, model
  elsif type && type === "new"
    link "New", new_admin_page_catering_menu_path
    parent :page, model
  else
    link model.name.titleize, admin_catering_menu_path(model)
    parent :page, model.page
  end
end

crumb :menu_section do |model, type|
  if type && type === "edit"
    link "Edit Menu Section", edit_admin_menu_section_path(model)
    parent :catering_menu, model.catering_menu
  elsif type && type === "new"
    link "New Menu Section", new_admin_catering_menu_menu_section_path
    parent :catering_menu, model
  else
    link model.name.titleize, admin_catering_menu_path(model.catering_menu)
    parent :catering_menu, model.catering_menu
  end
end

crumb :menu_item do |model, type|
  if type && type === "edit"
    link model.name.titleize, admin_catering_menu_path(model.catering_menu)
    link "Edit", admin_catering_menu_path(model.catering_menu)
    parent :menu_section, model.menu_section
  elsif type && type === "new"
    link "New", new_admin_menu_section_menu_item_path
    parent :menu_section, model
  end
end

crumb :service_item do |model, type|
  if type && type === "edit"
    link "Edit", edit_admin_service_item_path(model)
    parent :page, model.page
  elsif type && type === "new"
    link "New", new_admin_page_service_item_path
    parent :page, model
  end
end

crumb :featured_item do |model, type|
  if type && type === "edit"
    link "Edit Featured Item", edit_admin_featured_item_path(model)
    parent :page, model.page
  elsif type && type === "new"
    link "New Featured Item", new_admin_page_featured_item_path
    parent :page, model
  end
end

crumb :biography_item do |model, type|
  if type && type === "edit"
    link "Edit Biography Item", edit_admin_biography_item_path(model)
    parent :page, model.page, tab: "biography"
  elsif type && type === "new"
    link "New Biography Item", new_admin_page_biography_item_path
    parent :page, model, tab: "biography"
  end
end

crumb :event_item do |model, type|
  if type && type === "edit"
    link "Edit Month", edit_admin_event_item_path(model)
    parent :page, model.page
  elsif type && type === "new"
    link "New Month", new_admin_page_event_item_path
    parent :page, model
  end
end

crumb :event_produce_item do |model, type|
  if type && type === "new"
    link "Add Produce", new_admin_page_event_produce_item_path
    parent :page, model, tab: "produce"
  end
end

crumb :philosophy_item do |model, type|
  if type && type === "new"
    link "New Philosophy", new_admin_page_philosophy_item_path
    parent :page, model
  elsif type && type === "edit"
    link "Edit Philosophy", edit_admin_philosophy_item_path(model)
    parent :page, model.page
  end
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
