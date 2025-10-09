class RemoveExternoFromExternoestancia < ActiveRecord::Migration[7.1]
  def change
    remove_reference :externoestancias, :externo, null: false, foreign_key: true
  end
end
