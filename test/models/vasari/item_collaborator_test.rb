require 'test_helper'

module Vasari
  class ItemCollaboratorTest < ActiveSupport::TestCase
    test "Basic validation" do
      itemc = ItemCollaborator.new item_id: 2, collaborator_id: 1
      assert_not itemc.save, "ItemCollaborator not saved without :role"
      itemc = ItemCollaborator.new role_id: 1, collaborator_id: 1
      assert_not itemc.save, "ItemCollaborator not saved without :item"
      itemc = ItemCollaborator.new item_id: 2, role_id: 1
      assert_not itemc.save, "ItemCollaborator not saved without :collaborator"
      itemc = ItemCollaborator.new item_id: 2, collaborator_id: 1, role_id: 1
      assert itemc.save, "ItemCollaborator saved with :role, :item, :collaborator"
    end
    test "Combined uniqueness" do
      itemc = ItemCollaborator.new item_id: 2, collaborator_id: 1, role_id: 1
      assert itemc.save, 
        "ItemCollaborator saved with unique (:role, :item, :collaborator)"
      itemc = ItemCollaborator.new item_id: 2, collaborator_id: 1, role_id: 1
      assert_not itemc.save, 
        "ItemCollaborator not saved without unique (:role, :item, :collaborator)"
    end
  end
end
