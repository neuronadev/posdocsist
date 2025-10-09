class DropExternoestancia < ActiveRecord::Migration[7.1]
  def change
       drop_table :externoestancias
  end
end
