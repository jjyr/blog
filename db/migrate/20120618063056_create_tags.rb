class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :post

      t.timestamps
    end
    add_index :tags, :post_id
    add_index :tags, :name
  end
end
