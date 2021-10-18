class AddUniquenessConstraintLogin < ActiveRecord::Migration[6.1]
  def change
    add_index :empleados, :login, unique: true, name: 'index_unique_login'
  end
end
