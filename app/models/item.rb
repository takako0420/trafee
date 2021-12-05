class Item < ApplicationRecord
  validates :text, presence: true, length: { maximum: 100 }

  belongs_to :sheet
end
