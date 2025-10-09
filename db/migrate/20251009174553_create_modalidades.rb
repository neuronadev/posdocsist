class CreateModalidades < ActiveRecord::Migration[7.1]
  def change
    create_table :modalidades do |t|
      t.string :nommodal, limit: 100
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
