require 'rails_helper'

RSpec.describe ProcessesController, type: :controller do
  describe 'GET #show' do
    let(:valid_params) do 
      {
        number: "0067154-55.2010.8.02.0001",
        kind: 'Ação Civil Pública',
        area: 'Cível',
        subject: 'Tratamento Médico-Hospitalar e/ou Fornecimento de Medicamentos',
        distribution_date: '29/09/2010 às 15:57 - Sorteio',
        judge: 'Antonio Emanuel Dória Ferreira',
        action_value: 'R$510,00',
        crawler_updated_at: Time.current
      }
    end

    let(:process) do
      JudicialProcess.create(valid_params)
    end

    subject { get "/processes?number=#{process.number}" }

    it { expect(response).to have_http_status(:success) }
  end
end