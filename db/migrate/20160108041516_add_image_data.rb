class AddImageData < ActiveRecord::Migration
  def images_files
    image_files = Dir.glob('public/images/background/*.jpg').map {|dir| dir.gsub('public/', '')}
  end

  def up
    images_files.each do |image_file|
      next if Image.find_by_url(image_file)
      Image.create(url: image_file, imageable_type: 'background')
    end
  end

  def down
    images_files.each do |image_file|
      Image.find_by_url(image_file).destroy
    end
  end
end
