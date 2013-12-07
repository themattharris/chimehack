class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.belongs_to :creator, :class_name => "User"

      t.timestamps
    end
  end
end
