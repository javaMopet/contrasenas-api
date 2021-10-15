class CreateAplicaciones < ActiveRecord::Migration[6.1]
  def change
    create_table :aplicaciones do |t|
      t.string :nombre, limit: 30
      t.string :version, limit: 20

      t.timestamps
    end
  end
end
