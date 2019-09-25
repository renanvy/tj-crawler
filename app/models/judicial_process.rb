class JudicialProcess < ApplicationRecord
  validates(
    :number,
    :kind, 
    :area, 
    :subject, 
    :distribution_date, 
    :judge, 
    :action_value, 
    :crawler_updated_at,
    presence: true
  )

  validates :number, uniqueness: true
end
