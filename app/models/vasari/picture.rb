module Vasari
  class Picture < ActiveRecord::Base
    belongs_to :project, class_name: 'Vasari::Project', inverse_of: :pictures
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    enum role: [ :cover, :gallery ]

  end
end
