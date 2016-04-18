module Vasari
  class Collaborator < ActiveRecord::Base
    has_many :project_collaborators, class_name: "Vasari::ProjectCollaborator"
    has_many :roles, through: :project_collaborators, class_name: "Vasari::Role"
    has_many :projects, through: :project_collaborators, class_name: "Vasari::Project"
    accepts_nested_attributes_for :projects
    validates :name, presence: true, uniqueness: true

    rails_admin do 
      navigation_label "Collaborations"
    end
  end

end
