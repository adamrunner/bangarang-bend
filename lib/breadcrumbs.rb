module Breadcrumbs

  ROOTCRUMB = ["page", "index"]

  class Crumbs
    @@root = ROOTCRUMB
  end

  class PageCrumbs < Crumbs
    def self.index
      [@@root]
    end

    def self.show(page)
      [@@root, ["page", "show", page]]
    end
  end

  class MenuCrumbs < PageCrumbs
    def self.show(menu)
      [@@root, ["page", "show", menu.page]] << ["catering_menu", "show", menu]
    end

    def self.edit(menu)
      [@@root, ["page", "show", menu.page], ["catering_menu", "show", menu], ["catering_menu", "edit", menu]]
    end
  end

end
