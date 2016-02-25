task :delete_tmp_files do
  FileUtils.rm_rf Dir.glob("#{Rails.root}/public/uploads/tmp/*") #public/tmp/screenshots etc
  #note the asterisk which deletes folders and files whilst retaining the parent folder
end
