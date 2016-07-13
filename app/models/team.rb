class Team < ApplicationRecord
  has_many :games

  validates :name,
    presence:   true,
    uniqueness: true,
    length:     { maximum: 30 }

end
