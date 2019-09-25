class ProcessCrawler
  TJAL_URL = 'https://www2.tjal.jus.br/cpopg/search.do'.freeze

  def initialize(process_number)
    @process_number = process_number
  end

  def get_kind
    label = doc.at_xpath('//label[text()="Classe:"]')

    return unless label
    
    label.parent.parent.children[3].at_xpath('//span//span').text
  end

  def get_area
    label = doc.at_xpath('//span[text()="Área:"]')

    return unless label

    label.parent.children[2].text.strip.gsub(" ", "")
  end

  def get_subject
    label = doc.at_xpath('//label[text()="Assunto:"]')

    return unless label

    label.parent.parent.search('span:nth-child(1)').text
  end

  def get_distribution_date
    label = doc.at_xpath('//label[text()="Distribuição:"]')

    return unless label

    label.parent.parent.search('span:nth-child(1)').text
  end

  def get_judge
    label = doc.at_xpath('//label[text()="Juiz:"]')

    return unless label

    label.parent.parent.search('span:nth-child(1)').text
  end

  def get_action_value
    label = doc.at_xpath('//label[text()="Valor da ação:"]')

    return unless label
    
    label
    .parent
    .parent
    .search('span:nth-child(1)')
    .text
    .gsub("R$", "")
    .gsub(" ", "")
  end

  def get_movimentations
    div = doc.css('#tabelaTodasMovimentacoes')

    return unless div

    div.search('tr').map do |row|
      {
        date: row.search('td')[0].text.gsub(" ", ""),
        description: row.search('td')[2].text
      }
    end
  end

  private

  attr_reader :process_number

  def doc
    process_number_splited = process_number.split(".")

    @doc ||= Nokogiri::HTML(RestClient.get("#{TJAL_URL}?conversationId=&dadosConsulta.localPesquisa.cdLocal=81&cbPesquisa=NUMPROC&dadosConsulta.tipoNuProcesso=UNIFICADO&numeroDigitoAnoUnificado=#{process_number_splited.first}&foroNumeroUnificado=#{process_number_splited.last}&dadosConsulta.valorConsultaNuUnificado=#{process_number}&dadosConsulta.valorConsulta=&uuidCaptcha=sajcaptcha_6f50069f2dc34abcb3ba1f8ce53c7db2"))
  end
end