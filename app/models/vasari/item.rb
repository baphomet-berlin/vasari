module Vasari
  class Item < ActiveRecord::Base
    validates :title, presence: true
    validates :date, presence: true
    before_validation :handle_date
    belongs_to :listable, polymorphic: true
    has_many :item_collaborators
    has_many :collaborators, through: :item_collaborator

    scope :by_year, -> {
      order(date: :desc).group_by{ |item| item.date.year } 
    }

    def handle_date()
      if (self.date)
        self.current |= false;
        return
      elsif (self.date_end)
        self.current |= false;
        self.date = self.date_end
      elsif (self.date_start)
        self.current |= true;
        self.date = Date.today
      end
    end
  end
end
