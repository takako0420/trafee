class Sheet < ApplicationRecord

  with_options presence: true do
    validates :user_id
    validates :title, length: { maximum: 40 }
  end

  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
end
