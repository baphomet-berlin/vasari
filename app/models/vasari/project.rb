module Vasari
  class Project < ActiveRecord::Base
    has_many :project_collaborators, class_name: 'Vasari::ProjectCollaborator'
    has_many :collaborators, through: :project_collaborators, class_name: 'Vasari::Collaborator'
    has_many :pictures, class_name: 'Vasari::Picture'

    validates :title, presence: true
    validates :date, presence: true
    before_validation :handle_date

    rails_admin do
    end

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
