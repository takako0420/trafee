class Document < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :sheet_id
    with_options numericality: { only_integer: true } do
      validates :chose_one
      validates :chose_two
      validates :chose_three
      validates :chose_four
    end
  end

  belongs_to :user
  belongs_to :sheet
  has_many :comments, dependent: :destroy
end
