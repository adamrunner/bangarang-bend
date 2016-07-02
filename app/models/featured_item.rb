class FeaturedItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page

  def link_url=(value)
    return if value.blank?
    value = "http://" << value unless value =~ /http/i
    uri = URI.parse(value)
    link = if uri.host =~ /(www\.)?bangarangbend.com/i
            uri.path
          # elsif uri.instance_of?(URI::Generic)
          #   uri.path.gsub(/(www\.)?bangarangbend.com/i, '')
          else
            uri.scheme = "http" if uri.instance_of?(URI::HTTPS)
            uri.to_s
          end
    write_attribute(:link_url, link)
  end


  def full_link_url
    link = self.link_url
  end

  private

  def is_internal?
    true if link_url[/bangarangbend.com/i]
  end

  def to_relative
    link_url = link_url.gsub(/.+bangarangbend.com\//i, '/')
  end

  def to_http
    link_url = link_url.gsub(/https/i, 'http')
  end

end
