class AddTipoToSolicitud < ActiveRecord::Migration[7.1]
  def change
    add_column :solicitudes, :tipo, :string, limit: 1
  end
end
