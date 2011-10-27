class CreateAttachedFiles < ActiveRecord::Migration
  def self.up
    create_table :attached_files, :force => true do |t|
      t.references  :user
      t.string      :name, :limit => 64, :null => false, :default => ""
      t.string      :access, :limit => 8, :default => "Public" # %w(Private Public Shared)
      t.string      :file_name
      t.integer     :file_size
      t.string      :mime_type, :limit => 32
      t.string      :file_path
      t.references  :attachable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :attached_files
  end
end