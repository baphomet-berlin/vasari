module Vasari
  class Role < ActiveRecord::Base
    has_many :item_collaborators, class_name: 'Vasari::ItemCollaborator'
    has_many :collaborators, through: :item_collaborators, class_name: 'Vasari::Collaborator'
    validates :name, presence: true, uniqueness: true
  end
end
