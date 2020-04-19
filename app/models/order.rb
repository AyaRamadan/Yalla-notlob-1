class Order < ApplicationRecord
  belongs_to :user
  has_one_attached :menu
  enum category: [:breakfast, :dinner, :lunch]
end
