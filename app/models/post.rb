# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  featured   :boolean          default(FALSE)
#  visible    :boolean          default(FALSE)
#  slug       :string           not null
#

class Post < ActiveRecord::Base
  validates :featured, inclusion: { in: [true, false] }
  validates :slug, presence: true, allow_blank: false, length: { maximum: 75 }, uniqueness: true
  validates :title, presence: true, allow_blank: false, length: { maximum: 150 }
  validates :visible, inclusion: { in: [true, false] }

  # Rails admin config
  rails_admin do
    edit do
      field :title
      field :slug
      field :body, :ck_editor
      field :visible
      field :featured
    end
  end
end
