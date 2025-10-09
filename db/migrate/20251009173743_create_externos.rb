class CreateExternos < ActiveRecord::Migration[7.1]
  def change
    create_table :externos do |t|
      t.references :persona, null: false, foreign_key: true
      t.integer :cvu

      t.timestamps
    end
  end
end
