class ProcessCreator
  def self.create(process_number)
    new(process_number).create
  end

  def initialize(process_number)
    @process_number = process_number
    @crawler = ProcessCrawler.new(process_number)
  end

  def create
    process = JudicialProcess.new

    process.number = process_number
    process.kind = crawler.get_kind
    process.area = crawler.get_area
    process.subject = crawler.get_subject
    process.distribution_date = crawler.get_distribution_date
    process.judge = crawler.get_judge
    process.action_value = crawler.get_action_value
    process.plaintiff = crawler.get_plaintiff
    process.sued = crawler.get_sued
    process.crawler_updated_at = Time.current

    process.movimentations = crawler.get_movimentations.map do |movimentation_attrs|
      Movimentation.new(movimentation_attrs)
    end

    process.save
  end

  private

  attr_reader :process_number, :crawler
end