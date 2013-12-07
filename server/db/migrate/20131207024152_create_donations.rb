class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donor_id
      t.integer :cause_id
      t.string :currency, :limit => 5
      t.decimal :value, :precision => 8, :scale => 2
      t.integer :referrer_id
      t.string :transaction_id
      t.integer :transaction_source_id

      t.timestamps
    end
  end
end
