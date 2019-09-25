require 'rails_helper'

RSpec.describe ProcessFinder do
  describe '.find_or_update' do
    context 'when the process is not found in database' do
      it 'returns nil' do
        expect(ProcessFinder.find_or_update('number_invalid')).to be_nil
      end
    end

    context 'when the process is outdated' do
      let(:valid_params) do 
        {
          number: '0067154-55.2010.8.02.0001',
          kind: 'outdated',
          area: 'outdated',
          subject: 'outdated',
          distribution_date: 'outdated',
          judge: 'outdated',
          action_value: 'outdated',
          crawler_updated_at: Time.current - 120.days
        }
      end

      let(:process) { JudicialProcess.create(valid_params) }

      it 'returns process updated' do
        VCR.use_cassette :crawl_tj do
          expect(ProcessFinder.find_or_update(process.number)).to eq(process)
          
          process.reload
          expect(process.kind).not_to eq('outdated')
          expect(process.area).not_to eq('outdated')
          expect(process.subject).not_to eq('outdated')
          expect(process.distribution_date).not_to eq('outdated')
          expect(process.judge).not_to eq('outdated')
          expect(process.action_value).not_to eq('outdated')
          expect(process.crawler_updated_at).not_to eq('outdated')
        end
      end
    end

    context 'when the procces is updated' do
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

      let(:process) { JudicialProcess.create(valid_params) }

      it 'only returns the process' do
        expect(ProcessFinder.find_or_update(process.number)).to eq(process)
      end
    end
  end
end