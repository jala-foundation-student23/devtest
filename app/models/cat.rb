class Cat < ApplicationRecord
  has_many :tags, through: :cat_tag
  has_many :cat_tags, dependent: :destroy

  after_create_commit -> { broadcast_append_to "cats", partial: "cats/cat", locals: { cat: self }, target: "cats" }
end