class AddColToBillingstatements < ActiveRecord::Migration[5.1]
  def change
    add_reference :billingstatements, :patient, foreign_key: true
  end
end
