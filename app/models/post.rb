class Post < ApplicationRecord
  validates :name, presence :true, length: { maximum: 40 }

  belongs_to :user
  has_many :sheets
end

