class Kanmusu < ActiveRecord::Base
  has_attached_file :avatar, styles: {thumb: '50x50#', large: '175x175#'}, default_url: '/system/placeholder/avatar.gif'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :image, default_url: '/system/placeholder/image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
