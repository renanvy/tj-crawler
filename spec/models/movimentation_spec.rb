require 'rails_helper'

RSpec.describe Movimentation, type: :model do
  describe 'associations' do
    it { should belong_to(:judicial_process) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
  end
end
