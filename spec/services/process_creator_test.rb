require 'rails_helper'

RSpec.describe ProcessCreator do
  describe '.create' do
    context 'when the process is created successfully' do
      it 'creates a new process in database' do
        VCR.use_cassette :crawl_tj do
          ProcessCreator.create('0067154-55.2010.8.02.0001')
          
          process = JudicialProcess.find_by(number: '0067154-55.2010.8.02.0001')
          expect(process.kind).to eq('Ação Civil Pública')
          expect(process.area).to eq('Cível')
          expect(process.subject).to eq('Tratamento Médico-Hospitalar e/ou Fornecimento de Medicamentos')
          expect(process.distribution_date).to eq('29/09/2010 às 15:57 - Sorteio')
          expect(process.judge).to eq('Antonio Emanuel Dória Ferreira')
          expect(process.action_value).to eq('510,00')
          expect(process.crawler_updated_at).not_to be_nil
        end
      end
    end

    context 'when the process is not created' do
      it 'returns nil' do
        VCR.use_cassette :crawl_tj_not_found do
          ProcessCreator.create('invalid-number')
          
          process = JudicialProcess.find_by(number: 'invalid-number')
          expect(process).to be_nil
        end
      end
    end
  end
end