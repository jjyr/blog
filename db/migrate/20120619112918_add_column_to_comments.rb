class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :by_admin, :boolean,default: false
  end
end
