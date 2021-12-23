class Comment < ApplicationRecord
  with_options presence: true do
    validates :document_id, uniqueness: true
    validates :feedback
    validates :target
  end

  belongs_to :document
end
