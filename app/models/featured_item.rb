class FeaturedItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page

  def link_url=(value)
    return if value.blank?
    value = "http://" << value unless value =~ /http/i || value =~ /\A\//
    uri = URI.parse(value)
    link = if uri.host =~ /(www\.)?bangarangbend.com/i
            uri.path
          else
            uri.scheme = "http" if uri.instance_of?(URI::HTTPS)
            uri.to_s
          end
    write_attribute(:link_url, link)
  end

  def full_link_url
    link = link_url
  end
  
end
