class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.references :post,  null: false, foreign_key: true
      t.string     :title, null: false
      t.timestamps
    end
  end
end
