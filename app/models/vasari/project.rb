module Vasari
  class Project < ActiveRecord::Base
    has_many :project_collaborators, class_name: 'Vasari::ProjectCollaborator', inverse_of: :project, dependent: :destroy
    has_many :collaborators, through: :project_collaborators, class_name: 'Vasari::Collaborator'
    has_many :pictures, class_name: 'Vasari::Picture', dependent: :destroy, as: :imageable
    has_many :embeds, class_name: 'Vasari::Embed', dependent: :destroy, as: :embeddable
    accepts_nested_attributes_for :embeds, :allow_destroy => true
    accepts_nested_attributes_for :pictures, :allow_destroy => true
    accepts_nested_attributes_for :project_collaborators, :allow_destroy => true

    validates :title, presence: true
    validates :date, presence: true
    before_validation :handle_date
    before_save :set_slug



    scope :by_year, -> {
      order(date: :desc).group_by{ |item| item.date.year } 
    }

    def name
      self.title
    end

    def set_slug
      if self.slug.blank?
        self.slug = self.title.parameterize
      end
    end

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
