class AddFeaturedAndVisibleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured, :boolean, default: false
    add_column :projects, :visible, :boolean, default: false

    add_index :projects, :featured
    add_index :projects, :visible
  end
end
