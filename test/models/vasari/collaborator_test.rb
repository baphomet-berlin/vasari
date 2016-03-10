require 'test_helper'

module Vasari
  class CollaboratorTest < ActiveSupport::TestCase
    test "Basic validation" do
      collaborator = Collaborator.new
      assert_not collaborator.save, "Item not saved without :name"
      collaborator = Collaborator.new
      collaborator.name = "Mark"
      assert collaborator.save, "Item saved with :name"
      collaborator = Collaborator.new
      collaborator.name = "Mark"
      assert_not collaborator.save, "Item not saved without unique :name"
    end
  end
end
