require 'test_helper'

module Vasari
  class ProjectCollaboratorTest < ActiveSupport::TestCase
    def setup
      @project = vasari_projects(:one)
      @collaborator = vasari_collaborators(:one)
      @role = vasari_roles(:one)
    end

    test "Basic validation" do
      itemc = ProjectCollaborator.new project: @project, collaborator: @collaborator
      assert_not itemc.save, "ProjectCollaborator not saved without :role"
      itemc = ProjectCollaborator.new role: @role, collaborator: @collaborator
      assert_not itemc.save, "ProjectCollaborator not saved without :project"
      itemc = ProjectCollaborator.new project: @project, role: @role
      assert_not itemc.save, "ProjectCollaborator not saved without :collaborator"
      itemc = ProjectCollaborator.new project: @project, collaborator: @collaborator, role: @role
      assert itemc.save, "ProjectCollaborator saved with :role, :project, :collaborator"
    end
    test "Combined uniqueness" do
      itemc = ProjectCollaborator.new project: @project, collaborator: @collaborator, role: @role
      assert itemc.save, 
        "ProjectCollaborator saved with unique (:role, :project, :collaborator)"
      itemc = ProjectCollaborator.new project: @project, collaborator: @collaborator, role: @role
      assert_not itemc.save, 
        "ProjectCollaborator not saved without unique (:role, :project, :collaborator)"
    end
  end
end
 