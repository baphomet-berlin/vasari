module Vasari
  class Picture < ActiveRecord::Base
    belongs_to :imageable, polymorphic: true
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    enum role: [ :cover, :gallery ]

    def name
      if self.imageable
        "#{self.imageable.name} ##{self.id}"
      else
        "Unassigned ##{self.id}"
      end
    end
  end
end
