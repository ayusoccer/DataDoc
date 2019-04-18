class CreateBillingstatements < ActiveRecord::Migration[5.1]
  def change
    create_table :billingstatements do |t|
      t.date :date
      t.text :description
      t.float :total
      t.integer :statement_num

      t.timestamps
    end
  end
end
