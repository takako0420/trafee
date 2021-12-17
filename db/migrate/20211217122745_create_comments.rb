class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :document, null: false, foreign_key: true
      t.text :feedback,       null: false
      t.text :object,         null: false
      t.timestamps
    end
  end
end
