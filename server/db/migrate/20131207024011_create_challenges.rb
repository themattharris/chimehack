class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.decimal :target, :precision => 8, :scale => 2
      t.string :currency, :limit => 5
      t.decimal :current, :precision => 8, :scale => 2
      t.datetime :target_date

      t.belongs_to :creator, :class_name => "User"
      t.belongs_to :team

      t.timestamps
    end
  end
end
