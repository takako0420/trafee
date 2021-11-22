class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :sheet, null: false, foreign_key: true
      t.string     :text,  null: false
      t.timestamps
    end
  end
end
