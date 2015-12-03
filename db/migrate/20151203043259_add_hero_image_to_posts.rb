class AddHeroImageToPosts < ActiveRecord::Migration
  def up
    add_attachment :posts, :hero_image
  end

  def down
    remove_attachment :posts, :hero_image
  end
end
