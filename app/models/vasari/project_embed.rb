module Vasari
  class ProjectEmbed < ActiveRecord::Base
    belongs_to :project, class_name: 'Vasari::Project', inverse_of: :project_embed
    belongs_to :embed
    validates_presence_of :project
    validates_presence_of :embed
  end
end