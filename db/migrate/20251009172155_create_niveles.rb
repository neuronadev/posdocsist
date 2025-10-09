class CreateNiveles < ActiveRecord::Migration[7.1]
  def change
    create_table :niveles do |t|
      t.string :nomnivel, limit: 100
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
