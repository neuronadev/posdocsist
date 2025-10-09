class CreateAccesos < ActiveRecord::Migration[7.1]
  def change
    create_table :accesos do |t|
      t.references :persona, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true
      t.references :nivel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
