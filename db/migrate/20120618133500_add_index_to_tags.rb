class AddIndexToTags < ActiveRecord::Migration
  def change
    add_index :tags,[:post_id,:name],uniqueness: true
  end
end
