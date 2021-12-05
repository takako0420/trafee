class Sheet < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :title, length: { maximum: 40 }
  end

  belongs_to :user
  has_many :items, inverse_of: :sheet, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true
end
