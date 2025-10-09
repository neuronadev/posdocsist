class CreateTipoestancias < ActiveRecord::Migration[7.1]
  def change
    create_table :tipoestancias do |t|
      t.string :nomtipoes, limit: 50
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
