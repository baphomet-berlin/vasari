require 'test_helper'

module Vasari
  class ItemCollaboratorTest < ActiveSupport::TestCase
    def setup
      @item = vasari_items(:one)
      @collaborator = vasari_collaborators(:one)
      @role = vasari_roles(:one)
    end

    test "Basic validation" do
      itemc = ItemCollaborator.new item: @item, collaborator: @collaborator
      assert_not itemc.save, "ItemCollaborator not saved without :role"
      itemc = ItemCollaborator.new role: @role, collaborator: @collaborator
      assert_not itemc.save, "ItemCollaborator not saved without :item"
      itemc = ItemCollaborator.new item: @item, role: @role
      assert_not itemc.save, "ItemCollaborator not saved without :collaborator"
      itemc = ItemCollaborator.new item: @item, collaborator: @collaborator, role: @role
      assert itemc.save, "ItemCollaborator saved with :role, :item, :collaborator"
    end
    test "Combined uniqueness" do
      itemc = ItemCollaborator.new item: @item, collaborator: @collaborator, role: @role
      assert itemc.save, 
        "ItemCollaborator saved with unique (:role, :item, :collaborator)"
      itemc = ItemCollaborator.new item: @item, collaborator: @collaborator, role: @role
      assert_not itemc.save, 
        "ItemCollaborator not saved without unique (:role, :item, :collaborator)"
    end
  end
end
