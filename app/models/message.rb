class Message < ApplicationRecord
  # ransack用の検索条件を設定
  def self.ransackable_attributes(auth_object = nil)
    ["title", "score"]
  end
end
