require 'test_helper'

module Vasari
  class RoleTest < ActiveSupport::TestCase
    test "Basic validation" do
      role = Role.new
      assert_not role.save, "Item not saved without :name"
      role = Role.new
      role.name = "Babe"
      assert role.save, "Item saved with :name"
      role = Role.new
      role.name = "Babe"
      assert_not role.save, "Item not saved without unique :name"
    end
  end
end
