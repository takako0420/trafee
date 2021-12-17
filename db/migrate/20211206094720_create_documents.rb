class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sheet, null: false, foreign_key: true
      t.integer :chose_one
      t.integer :chose_two
      t.integer :chose_three
      t.integer :chose_four
      t.timestamps
    end
  end
end
