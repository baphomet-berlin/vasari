module Vasari
  class LifeEvent < ActiveRecord::Base
    has_one :item, as: :listable
  end
end
