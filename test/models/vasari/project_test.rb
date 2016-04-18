require 'test_helper'

module Vasari
  class ProjectTest < ActiveSupport::TestCase
    test "Basic validation" do
      item = Project.new
      item.date = Date.today
      assert_not item.save, "Project not saved without :title"
      item = Project.new
      item.title = "My title"
      assert_not item.save, "Project not saved without :date"
      item = Project.new
      item.title = "My title"
      item.date = Date.today
      assert item.save, "Project saved with :title and :date"
    end
  end
  class ProjectTest::DateHandlingTest < ActiveSupport::TestCase
    setup do
      @item = Project.new
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
  class ProjectTest::ByYear < ActiveSupport::TestCase
    test "correctly group by :date.year" do 
      items = Project.all.by_year
      assert_equal items.length, 2, "correct number of groups"
      assert_equal items[2016].length, 2
      assert_equal items[2015].length, 1, "correct number of Projects per group"
    end
  end
  class ProjectTest::Associations < ActiveSupport::TestCase
    test "associates to :project_collaborators" do 
      item = Project.find(1)
      assert_equal item.project_collaborators.first.id, 1, "correct listable id"
    end
  end
end
