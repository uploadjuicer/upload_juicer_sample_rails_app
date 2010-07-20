class CreateUploadTables < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string  :file_name
      t.string  :key
      t.integer :size
      t.integer :uploadable_id
      t.string  :uploadable_type

      t.timestamps
    end
    
    add_index :uploads, :key
    add_index :uploads, [:uploadable_id, :uploadable_type]
  end

  def self.down
    drop_table :uploads
  end
end
