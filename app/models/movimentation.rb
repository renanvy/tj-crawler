class Movimentation < ApplicationRecord
  belongs_to :judicial_process

  validates :date, :description, presence: true
end
