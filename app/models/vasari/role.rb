module Vasari
  class Role < ActiveRecord::Base
    has_many :item_collaborators, class_name: 'Vasari::ItemCollaborator'
    has_many :collaborators, through: :item_collaborators, class_name: 'Vasari::Collaborator'
    has_many :portfolio_items, through: :item_collaborators, class_name: 'Vasari::PortfolioItem'

    validates :name, presence: true, uniqueness: true
    rails_admin do 
      navigation_label "Collaborations"
      field :name
    end
  end
end
