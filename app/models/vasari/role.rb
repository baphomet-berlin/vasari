module Vasari
  class Role < ActiveRecord::Base
    has_many :item_collaborators
    has_many :vasari_collaborators, through: :item_collaborator
  end
end
