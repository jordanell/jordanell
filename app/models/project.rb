# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  featured    :boolean          default(FALSE)
#  visible     :boolean          default(FALSE)
#  slug        :string           not null
#

class Project < ActiveRecord::Base
  validates :featured, inclusion: { in: [true, false] }
  validates :name, presence: true, allow_blank: false, length: { maximum: 200 }
  validates :slug, presence: true, allow_blank: false, length: { maximum: 75 }, uniqueness: true
  validates :visible, inclusion: { in: [true, false] }

  # Rails admin config
  rails_admin do
    edit do
      field :name
      field :slug
      field :description, :ck_editor
      field :visible
      field :featured
    end
  end
end
