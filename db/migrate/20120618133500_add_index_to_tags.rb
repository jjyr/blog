class AddIndexToTags < ActiveRecord::Migration
  def change
    add_index :tags,[:post_id,:name],uniquness: true
  end
end
