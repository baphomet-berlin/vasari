module Vasari
  class LifeEvent < ActiveRecord::Base
    has_one :item, as: :listable, class_name: 'Vasari::Item'
  end
end
