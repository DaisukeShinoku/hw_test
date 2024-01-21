class Message < ApplicationRecord
  validates :title, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # ransack用の検索条件を設定
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "score"]
  end
end
