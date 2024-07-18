class CreatePointTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :point_transactions do |t|
      t.integer :amount
      t.references :wallet
      t.references :voucher

      t.timestamps
    end
  end
end
