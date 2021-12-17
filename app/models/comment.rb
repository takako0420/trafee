class Comment < ApplicationRecord
  with_options presence: true do
    validates :document_id
    validates :feedback
    validates :objeck
  end

  belongs_to :document
end
