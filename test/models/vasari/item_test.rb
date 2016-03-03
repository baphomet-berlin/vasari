require 'test_helper'

module Vasari
  class ItemTest < ActiveSupport::TestCase
    test "does not save item without title" do
      item = Item.new
      item.date = Date.today
      assert_not item.save, "Saved Item without title"
    end
    test "does not save item without date" do
      item = Item.new
      item.title = "My title"
      assert_not item.save, "Saved Item without date"
    end
    test "saves item with title and date" do
      item = Item.new
      item.title = "My title"
      item.date = Date.today
      assert item.save
    end
  end
end
