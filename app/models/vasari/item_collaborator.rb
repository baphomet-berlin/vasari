module Vasari
  class ItemCollaborator < ActiveRecord::Base
    belongs_to :item
    belongs_to :collaborator
    belongs_to :role
    validates :item, presence: :true
    validates :collaborator_id, presence: :true
    validates :role, presence: true
    validates :item, uniqueness: { scope: [:role, :collaborator] }
  end
end
