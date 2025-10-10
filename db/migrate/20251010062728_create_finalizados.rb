class CreateFinalizados < ActiveRecord::Migration[7.1]
  def change
    create_table :finalizados do |t|
      t.references :estancia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
