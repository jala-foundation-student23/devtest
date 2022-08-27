class Tag < ApplicationRecord
  has_many :cats, through: :cat_tag
  has_many :cat_tags
end
