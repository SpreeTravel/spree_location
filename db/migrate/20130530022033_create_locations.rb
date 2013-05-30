class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :locationable, :polymorphic => true
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
