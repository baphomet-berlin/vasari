module Vasari
  class ItemCollaborator < ActiveRecord::Base
    belongs_to :item
    belongs_to :collaborator
    belongs_to :role
    validates :item_id, presence: :true
    validates :collaborator_id, presence: :true
    validates :role, presence: true
    validates :item_id, uniqueness: { scope: [:role_id, :collaborator_id] }
  end
end
