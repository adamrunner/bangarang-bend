class AddShowCopyTextDataToEvents < ActiveRecord::Migration
  def page
    page = Page.find_by(name: 'events')
  end

  def up
    page.show_copy_text = true
    page.save
  end

  def down

  end
end
