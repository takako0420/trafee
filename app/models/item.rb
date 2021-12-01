class Item < ApplicationRecord
  with_options presence: true do
    validates :sheet_id
    validates :text, length: { maximum: 100 }
  end

  belongs_to :sheet
end
