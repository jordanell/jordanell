class Project < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false, length: { maximum: 200 }
end
