module Vasari
  class Work < ActiveRecord::Base

    after_initialize :grab_empty_item
    validates :date, presence: true

    has_one :item, as: :listable, class_name: 'Vasari::Item'

    accepts_nested_attributes_for :item
    rails_admin do 
      visible false
    end
    
    private
    def grab_empty_item
      self.item ||= Vasari::Item.new
    end
  end

end
