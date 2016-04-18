module Vasari
  class Role < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true
    rails_admin do 
      navigation_label "Collaborations"
      field :name
    end
  end
end
