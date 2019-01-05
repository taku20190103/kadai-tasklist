class Task < ApplicationRecord
  # contentカラムのバリデーションも念のため追加します
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: {maximum: 10 }
end
