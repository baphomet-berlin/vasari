module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :item_collaborators, class_name: "Vasari::ItemCollaborator"
    has_many :roles, through: :item_collaborators, class_name: "Vasari::Role"
    has_many :portfolio_items, through: :item_collaborators, class_name: "Vasari::PortfolioItem"
    accepts_nested_attributes_for :portfolio_items
    validates :name, presence: true, uniqueness: true

    rails_admin do 
      navigation_label "Collaborations"
    end
  end

end
