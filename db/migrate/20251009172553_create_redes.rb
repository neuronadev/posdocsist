class CreateRedes < ActiveRecord::Migration[7.1]
  def change
    create_table :redes do |t|
      t.string :nomred, limit: 150
      t.string :lugar, limit: 150
      t.string :tipored, limit: 4

      t.timestamps
    end
  end
end
