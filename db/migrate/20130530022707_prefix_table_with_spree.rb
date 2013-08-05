class PrefixTableWithSpree < ActiveRecord::Migration
  def change    
	rename_table :locations, :spree_locations
  end
end
