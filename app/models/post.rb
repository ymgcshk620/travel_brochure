class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :text, presence: true
  validate :start_end_check
  
   def start_end_check
     if start_time.present? && end_time.present? && start_time > end_time
     errors.add(:end_time, "は開始日時より遅い時間を選択してください。")
     end
   end
  
  mount_uploader :image01, ImageUploader
  mount_uploader :image02, ImageUploader
  mount_uploader :image03, ImageUploader
  belongs_to :user, optional: true
end