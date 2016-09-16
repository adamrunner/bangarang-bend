class Farm < ActiveRecord::Base
  mount_uploader :farm_image, FarmImageUploader
  belongs_to :page

  def url=(value)
    return if value.blank?
    value = "http://" << value unless value =~ /http/i
    uri = URI.parse(value)
    uri.scheme = "http" if uri.instance_of?(URI::HTTPS)
    uri.to_s
    write_attribute(:url, uri)
  end
end
