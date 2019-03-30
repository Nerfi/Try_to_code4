class Review < ApplicationRecord
  belongs_to :gym
  validates :content, length: { minimum: 15}
end
