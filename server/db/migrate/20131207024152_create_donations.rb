class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :currency, :limit => 5
      t.decimal :value, :precision => 8, :scale => 2
      t.string :transaction_id
      t.integer :transaction_source_id

      t.belongs_to :donor, :class_name => "User"
      t.belongs_to :referrer, :class_name => "User"
      t.belongs_to :challenge

      t.timestamps
    end
  end
end
