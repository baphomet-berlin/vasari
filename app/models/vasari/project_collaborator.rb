module Vasari
  class ProjectCollaborator < ActiveRecord::Base
    belongs_to :project, class_name: 'Vasari::Project', :inverse_of => :project_collaborators
    belongs_to :collaborator, class_name: 'Vasari::Collaborator'
    belongs_to :role, class_name: 'Vasari::Role'
    validates :project, presence: :true
    validates :collaborator, presence: :true
    validates :role, presence: true
    validates :project, uniqueness: { scope: [:role, :collaborator] }
  end
end
