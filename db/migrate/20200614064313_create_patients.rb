class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :dept
      t.integer :age
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
