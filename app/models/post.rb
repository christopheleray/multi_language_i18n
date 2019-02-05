# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  default_scope { order(updated_at: :desc) }
  validates :title, presence: true, allow_nil: false
end
