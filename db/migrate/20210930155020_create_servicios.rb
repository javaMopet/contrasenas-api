class CreateServicios < ActiveRecord::Migration[6.1]
  def change
    create_table :servicios do |t|
      t.references :servidor, null: false, foreign_key: true
      t.references :aplicacion, null: false, foreign_key: true
      t.integer :puerto

      t.timestamps
    end
  end
end
