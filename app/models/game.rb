class Game < ApplicationRecord
  belongs_to :team

  validates :date,  presence: true
  validates :time,  presence: true
  validates :field, presence: true

end
