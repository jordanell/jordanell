# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  title                   :string           not null
#  body                    :text
#  created_at              :datetime
#  updated_at              :datetime
#  featured                :boolean          default(FALSE)
#  visible                 :boolean          default(FALSE)
#  slug                    :string           not null
#  hero_image_file_name    :string
#  hero_image_content_type :string
#  hero_image_file_size    :integer
#  hero_image_updated_at   :datetime
#

class Post < ActiveRecord::Base
  has_attached_file :hero_image,
                    styles: { large: '1920x1080>', medium: '1280:720>', small: '640x360' },
                    storage: :s3,
                    s3_credentials: S3_CONFIG_FILE,
                    bucket: S3_CONFIG['posts_bucket']

  validates :featured, inclusion: { in: [true, false] }
  validates :slug, presence: true, allow_blank: false, length: { maximum: 75 }, uniqueness: true
  validates :title, presence: true, allow_blank: false, length: { maximum: 150 }
  validates :visible, inclusion: { in: [true, false] }

  validates_attachment :hero_image, presence: true,
    content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
    size: { in: 0..5.megabytes }

  validate :featured_and_visible

  # Rails admin config
  rails_admin do
    edit do
      field :title
      field :slug
      field :hero_image, :paperclip
      field :body, :ck_editor
      field :visible
      field :featured
    end
  end

  private

  def featured_and_visible
    # A post can only be featured if it is visible
    errors.add(:featured, 'Cannot be featured and not visible') if featured && !visible
  end
end
