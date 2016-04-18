module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :item_collaborators, class_name: "Vasari::ItemCollaborator"
    has_many :roles, through: :item_collaborators, class_name: "Vasari::Role"
    has_many :items, through: :item_collaborators, class_name: "Vasari::Item"
    accepts_nested_attributes_for :items
    validates :name, presence: true, uniqueness: true

    rails_admin do 
      visible false
    end
  end

end
