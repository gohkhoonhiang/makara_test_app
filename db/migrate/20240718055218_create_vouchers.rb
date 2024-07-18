class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :title
      t.integer :cost

      t.timestamps
    end
  end
end
