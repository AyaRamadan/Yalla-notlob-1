class Group < ApplicationRecord
  belongs_to :user , optional:true
  has_many :friendships,dependent: :nullify
end
