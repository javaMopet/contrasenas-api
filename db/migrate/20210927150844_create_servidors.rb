class CreateServidors < ActiveRecord::Migration[6.1]
  def change
    create_table :servidors do |t|
      t.string :nombre, limit: 60
      t.string :ip, limit: 20

      t.timestamps
    end
  end
end
