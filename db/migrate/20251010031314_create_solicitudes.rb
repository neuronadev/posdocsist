class CreateSolicitudes < ActiveRecord::Migration[7.1]
  def change
    create_table :solicitudes do |t|
      t.references :estancia, null: false, foreign_key: true
      t.integer :validador
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
