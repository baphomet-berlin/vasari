module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :item_collaborators
    has_many :roles, through: :item_collaborator
    has_many :items, through: :item_collaborator
    validates :name, presence: true, uniqueness: true
  end
end
