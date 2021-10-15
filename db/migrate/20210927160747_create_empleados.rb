class CreateEmpleados < ActiveRecord::Migration[6.1]
  def change
    create_table :empleados do |t|
      t.string :nombre, limit: 30, null: false
      t.integer :rol, null: false 
      t.string :login, limit: 20
      t.string :password, limit: 20
      t.timestamps
    end
  end
end
