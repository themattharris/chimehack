class CreateIncentives < ActiveRecord::Migration
  def change
    create_table :incentives do |t|
      t.integer :value
      t.string :description

      t.timestamps
    end
  end
end
