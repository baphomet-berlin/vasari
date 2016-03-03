module Vasari
  class Item < ActiveRecord::Base
    validates :title, presence: true
    validates :date, presence: true
    before_save :handle_date

    def handle_date()
      if (self.date)
        return
      elsif (self.end_date)
        self.date = self.end_date
      elsif (self.start_date)
        self.date = Date.today
      end
    end
  end
end
