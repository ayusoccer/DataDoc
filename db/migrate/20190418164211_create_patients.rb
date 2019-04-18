class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :insurance

      t.timestamps
    end
  end
end
