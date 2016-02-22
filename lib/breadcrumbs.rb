module Breadcrumbs

  ROOTCRUMB = ["page", "index"]


  class Crumbs
    @@root = ROOTCRUMB
    @@all_fields = []
    @@breadcrumbs = []

    def self.current(position, crumb)
      length = @@breadcrumbs.length
      if length < position
        @@breadcrumbs.push(crumb)
      elsif length === position
        @@breadcrumbs.pop(1)
        @@breadcrumbs.push(crumb)
      else
        @@breadcrumbs.pop(length - position)
      end
      return @@breadcrumbs
    end
  end

  class PageCrumbs < Crumbs
    def self.index
      current(1, @@root)
    end

    def self.show(page)
      current(2, ["page", "show", page])
    end
  end

  class MenuCrumbs < PageCrumbs
    def self.show(menu)
      current(3, ["catering_menu", "show", menu])
    end

    def self.edit(menu)
      current(4, ["catering_menu", "edit", menu])
    end
  end

end
