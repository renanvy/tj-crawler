class JudicialProcessSerializer < ActiveModel::Serializer
  attributes :id, :number, :kind, :area, :subject, :distribution_date, :judge, 
    :action_value, :crawler_updated_at, :plaintiff, :sued

  has_many :movimentations
end
