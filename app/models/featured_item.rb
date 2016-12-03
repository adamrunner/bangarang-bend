class FeaturedItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page

  default_scope { order(:position) }

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

  def pretty_print_created_at
    t = created_at
    formatted = t.strftime("%B #{t.day.ordinalize}, %Y") 
  end

end
