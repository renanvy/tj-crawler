class ProcessFinder
  def self.find_or_update(process_number)
    new(process_number).find_or_update
  end

  def initialize(process_number)
    @process_number = process_number
    @crawler = ProcessCrawler.new(process_number)
  end

  def find_or_update
    return unless process

    update_process if outdated_process?
    
    process
  end

  private

  attr_reader :process_number, :crawler

  def outdated_process?
    (process.crawler_updated_at + 24.hours) <= Time.current
  end

  def process
    @process ||= JudicialProcess.find_by(number: process_number)
  end

  def update_process
    process.number = process_number
    process.kind = crawler.get_kind
    process.area = crawler.get_area
    process.subject = crawler.get_subject
    process.distribution_date = crawler.get_distribution_date
    process.judge = crawler.get_judge
    process.action_value = crawler.get_action_value
    process.crawler_updated_at = Time.current

    process.movimentations.destroy_all
    process.movimentations = crawler.get_movimentations.map do |movimentation_attrs|
      Movimentation.new(movimentation_attrs)
    end

    process.save
  end
end