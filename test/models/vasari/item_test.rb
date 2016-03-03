require 'test_helper'

module Vasari
  class ItemTest < ActiveSupport::TestCase
    test "Basic validation" do
      item = Item.new
      item.date = Date.today
      assert_not item.save, "Did not save item without title"
      item = Item.new
      item.title = "My title"
      assert_not item.save, "Did not save Item without date"
      item = Item.new
      item.title = "My title"
      item.date = Date.today
      assert item.save, "Saved Item with title and date"
    end
  end
  class ItemTest::DateHandlingTest < ActiveSupport::TestCase
    setup do
      @item = Item.new
      @item.title = "My title"  
    end
    test "only date_start" do 
      @item.date_start = Date.yesterday
      @item.save
      assert_equal @item.date, Date.today, "Date set to today"
      assert @item.current, "Current set to true"
    end
    test "only date_end" do 
      @item.date_end = Date.yesterday
      @item.save
      assert_equal @item.date, Date.yesterday, "Date set to date_end"
      assert_not @item.current, "Current set to false"
    end
    test "date set directly" do
      @item.date = Date.yesterday
      @item.save
      assert_equal @item.date, Date.yesterday, "Date unchanged"
      assert_not @item.current, "Current set to false"
    end
  end
end
