class CreatePersonas < ActiveRecord::Migration[7.1]
  def change
    create_table :personas do |t|
      t.string :nombre, limit: 150
      t.string :apaterno, limit: 150
      t.string :amaterno, limit: 150
      t.references :tipopersona, null: false, foreign_key: true
      t.references :red, null: false, foreign_key: true

      t.timestamps
    end
  end
end
