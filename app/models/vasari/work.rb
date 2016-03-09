module Vasari
  class Work < ActiveRecord::Base
    has_one :item, as: :listable
  end
end
