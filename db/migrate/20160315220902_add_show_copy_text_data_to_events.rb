class AddShowCopyTextDataToEvents < ActiveRecord::Migration
  def up
    page = Page.find_by(name: 'events')
    page.show_copy_text = true
    page.save
  end

  def down

  end
end
