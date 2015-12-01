class AddFeaturedAndVisibleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :boolean, default: false
    add_column :posts, :visible, :boolean, default: false

    add_index :posts, :featured
    add_index :posts, :visible
  end
end
