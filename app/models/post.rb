class Post < ActiveRecord::Base
  validates :title, presence: true, allow_blank: false, length: { maximum: 150 }
end
