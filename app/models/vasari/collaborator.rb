module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :item_collaborators, class_name: "Vasari::ItemCollaborator"
    has_many :roles, through: :item_collaborators, class_name: "Vasari::Role"
    has_many :items, through: :item_collaborators, class_name: "Vasari::Item"
    validates :name, presence: true, uniqueness: true
  end
end
