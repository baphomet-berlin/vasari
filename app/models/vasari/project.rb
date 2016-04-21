module Vasari
  class Project < ActiveRecord::Base
    has_many :project_collaborators, class_name: 'Vasari::ProjectCollaborator', inverse_of: :project
    has_many :collaborators, through: :project_collaborators, class_name: 'Vasari::Collaborator'
    has_many :pictures, class_name: 'Vasari::Picture', inverse_of: :project
    has_many :embeds, class_name: 'Vasari::Embed', inverse_of: :project

    validates :title, presence: true
    validates :date, presence: true
    before_validation :handle_date


    scope :by_year, -> {
      order(date: :desc).group_by{ |item| item.date.year } 
    }

    private

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
