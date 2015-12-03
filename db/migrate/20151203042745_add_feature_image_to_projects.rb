class AddFeatureImageToProjects < ActiveRecord::Migration
  def up
    add_attachment :projects, :hero_image
  end

  def down
    remove_attachment :projects, :hero_image
  end
end
