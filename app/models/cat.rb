class Cat < ApplicationRecord
  has_many :tags, through: :cat_tag
  has_many :cat_tags
end