require 'spec_helper'
require 'vcr_helper'
require 'nokogiri'
require 'rest-client'
require_relative '../../app/services/process_crawler'

RSpec.describe ProcessCrawler do
  subject { ProcessCrawler.new('0067154-55.2010.8.02.0001') }

  describe '#get_kind' do
    it 'returns kind info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_kind).to eq('Ação Civil Pública')
      end
    end
  end

  describe '#get_area' do
    it 'returns area info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_area).to eq('Cível')
      end
    end
  end

  describe '#get_subject' do
    it 'returns subject info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_subject).to eq('Tratamento Médico-Hospitalar e/ou Fornecimento de Medicamentos')
      end
    end
  end

  describe '#get_distribution_date' do
    it 'returns distribution date info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_distribution_date).to eq('29/09/2010 às 15:57 - Sorteio')
      end
    end
  end

  describe '#get_judge' do
    it 'returns judge info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_judge).to eq('Antonio Emanuel Dória Ferreira')
      end
    end
  end

  describe '#get_action_value' do
    it 'returns action value info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_action_value).to eq('510,00')
      end
    end
  end

  describe '#get_movimentations' do
    it 'returns movimentations info' do
      VCR.use_cassette :crawl_tj do
        expect(subject.get_movimentations).not_to be_empty
      end
    end
  end
end