class RemoveEstanciaFromExternoestancia < ActiveRecord::Migration[7.1]
  def change
    remove_reference :externoestancias, :estancia, null: false, foreign_key: true
  end
end
