class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :text, presence: true
end