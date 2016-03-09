module Vasari
  class ItemCollaborator < ActiveRecord::Base
    belongs_to :item
    belongs_to :collaborator
    belongs_to :role
  end
end
