class AddShowCopyTextToPages < ActiveRecord::Migration
  def change
    add_column :pages, :show_copy_text, :boolean, default: false
  end
end
