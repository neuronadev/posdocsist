class CreateExternoestancias < ActiveRecord::Migration[7.1]
  def change
    create_table :externoestancias do |t|
      t.references :externo, null: false, foreign_key: true
      t.references :estancia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
