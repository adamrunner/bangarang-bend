module NavigationHelper

  def page_link(page)
    if page.link_name != 'home'
      page.link_name.parameterize("_")
    else
      ""
    end
  end

end
