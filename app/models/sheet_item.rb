class SheetItem

  include ActiveModel::Model
  attr_accessor :sheet_id, :post_id, :title, :text

  with_option presence: true do
    validates :post_id
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 100 }
  end

  def save
    sheet = Sheet.create(post_id: post_id, title: title)
    Item.create(text: text, sheet_id: sheet_id)
  end
end