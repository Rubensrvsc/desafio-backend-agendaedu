require 'rails_helper'

RSpec.describe Workers::RegisterExpenses do

  describe "#worker" do
    it "create records" do
      path = Rails.root.join('spec/upload/ano-2021.csv')
      described_class.perform_async(path)
      expect(described_class.jobs.size).to eq(1)
    end
  end
end
