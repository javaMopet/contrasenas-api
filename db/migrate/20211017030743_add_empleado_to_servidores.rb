class AddEmpleadoToServidores < ActiveRecord::Migration[6.1]
  def change
    add_reference :servidores, :empleado, null: false, foreign_key: true
  end
end
