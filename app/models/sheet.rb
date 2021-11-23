class Sheet < ApplicationRecord
  belongs_to :post
  has_many :items
end
