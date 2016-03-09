require 'test_helper'

module Vasari
  class ItemTest < ActiveSupport::TestCase
    test "Basic validation" do
      item = Item.new
      item.date = Date.today
      assert_not item.save, "Item not saved without :title"
      item = Item.new
      item.title = "My title"
      assert_not item.save, "Item not saved without :date"
      item = Item.new
      item.title = "My title"
      item.date = Date.today
      assert item.save, "Item saved with :title and :date"
    end
  end
  class ItemTest::DateHandlingTest < ActiveSupport::TestCase
    setup do
      @item = Item.new
      @item.title = "My title"  
    end
    test "only :date_start" do 
      @item.date_start = Date.yesterday
      @item.save
      assert_equal @item.date, Date.today, ":date set to today"
      assert @item.current, ":current set to true"
    end
    test "only :date_end" do 
      @item.date_end = Date.yesterday
      @item.save
      assert_equal @item.date, Date.yesterday, ":date set to date_end"
      assert_not @item.current, ":current set to false"
    end
    test ":date set directly" do
      @item.date = Date.yesterday
      @item.save
      assert_equal @item.date, Date.yesterday, ":date unchanged"
      assert_not @item.current, ":current set to false"
    end
  end
  class ItemTest::ByYear < ActiveSupport::TestCase
    test "correctly group by :date.year" do 
      items = Item.all.by_year
      assert_equal items.length, 2, "correct number of groups"
      assert_equal items[2016].length, 2
      assert_equal items[2015].length, 1, "correct number of Items per group"
    end
  end
  class ItemTest::Associations < ActiveSupport::TestCase
    test "associates to work items" do 
      item = Item.find(1)
      assert_equal item.listable.id, 1, "correct listable id"
      assert_equal item.listable_type, 1, 1, "correct listable type"
    end
  end
end
