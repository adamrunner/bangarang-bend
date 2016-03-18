class AddCopyTextToPages < ActiveRecord::Migration
  def change
    add_column :pages, :copy_text, :text;
  end
end
