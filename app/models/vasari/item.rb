module Vasari
  class Item < ActiveRecord::Base
    belongs_to :listable, polymorphic: true
    has_many :item_collaborators, class_name: 'Vasari::ItemCollaborator'
    has_many :collaborators, through: :item_collaborators, class_name: 'Vasari::Collaborator'
    has_many :pictures, class_name: 'Vasari::Picture'

    validates :title, presence: true
    validates :date, presence: true
    before_validation :handle_date

    scope :by_year, -> {
      order(date: :desc).group_by{ |item| item.date.year } 
    }


    rails_admin do 
      visible false
    end

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
