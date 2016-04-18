module Vasari
  class ItemCollaborator < ActiveRecord::Base
    belongs_to :item, class_name: 'Vasari::Item'
    belongs_to :collaborator, class_name: 'Vasari::Collaborator'
    belongs_to :role, class_name: 'Vasari::Role'
    validates :item, presence: :true
    validates :collaborator, presence: :true
    validates :role, presence: true
    validates :item, uniqueness: { scope: [:role, :collaborator] }
    rails_admin do 
      visible false
    end
  end
end
