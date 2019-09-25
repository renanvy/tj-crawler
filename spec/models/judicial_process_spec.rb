require 'rails_helper'

RSpec.describe JudicialProcess, type: :model do
  let(:valid_params) do 
    {
      number: "a123",
      kind: 'Ação Civil Pública',
      area: 'Cível',
      subject: 'Tratamento Médico-Hospitalar e/ou Fornecimento de Medicamentos',
      distribution_date: '29/09/2010 às 15:57 - Sorteio',
      judge: 'Antonio Emanuel Dória Ferreira',
      action_value: 'R$510,00',
      crawler_updated_at: Time.current
    }
  end

  describe 'associations' do
    it { should have_many(:movimentations) }
  end

  describe 'validations' do
    subject { JudicialProcess.new(valid_params) }

    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:area) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:distribution_date) }
    it { should validate_presence_of(:judge) }
    it { should validate_presence_of(:action_value) }
    it { should validate_presence_of(:crawler_updated_at) }

    it { should validate_uniqueness_of(:number) }
  end
end
