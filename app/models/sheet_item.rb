class SheetItem
  include ActiveModel::Model
  attr_accessor :user_id, :title, :text, :sheet_id

  with_options presence: true do
    validates :user_id
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 100 }
  end

  def save
    sheet = Sheet.create(user_id: user_id, title: title)
    Item.create(sheet_id: sheet.id, text: text)
  end
end
