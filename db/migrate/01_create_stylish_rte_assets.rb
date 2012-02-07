class CreateStylishRteAssets < ActiveRecord::Migration
  def self.up
    create_table :stylish_rte_assets do |t|
      t.string  :data_file_name, :null => false
      t.string  :data_content_type
      t.integer :data_file_size

      t.string :data_file_description

      t.integer :assetable_id
      t.string  :assetable_type, :limit => 30
      t.string  :type, :limit => 30

      t.timestamps
    end

    add_index "stylish_rte_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_stylish_rte_assetable_type"
    add_index "stylish_rte_assets", ["assetable_type", "assetable_id"], :name => "idx_stylish_rte_assetable"
  end

  def self.down
    drop_table :stylish_rte_assets
  end
end
