class CreateTipopersonas < ActiveRecord::Migration[7.1]
  def change
    create_table :tipopersonas do |t|
      t.string :nomtipoper, limit: 3
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
