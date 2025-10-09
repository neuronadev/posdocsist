class CreateEstancias < ActiveRecord::Migration[7.1]
  def change
    create_table :estancias do |t|
      t.references :persona, null: false, foreign_key: true
      t.references :modalidad, null: false, foreign_key: true
      t.references :tipoestancia, null: false, foreign_key: true
      t.integer :responsable
      t.text :titulo
      t.datetime :finicio
      t.datetime :ftermino
      t.text :tematica
      t.text :notas
      t.string :estado, limit: 4

      t.timestamps
    end
  end
end
