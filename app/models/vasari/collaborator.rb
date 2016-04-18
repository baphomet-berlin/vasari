module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :portfolio_item_collaborators, class_name: "Vasari::PortfolioItemCollaborator"
    has_many :roles, through: :item_collaborators, class_name: "Vasari::Role"
    has_many :items, through: :item_collaborators, class_name: "Vasari::Item"
    accepts_nested_attributes_for :items
    validates :name, presence: true, uniqueness: true

    rails_admin do 
      navigation_label "Collaborations"
    end
  end

end
