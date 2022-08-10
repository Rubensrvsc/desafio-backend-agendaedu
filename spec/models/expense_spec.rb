require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'testing model expense' do
    let!(:congressperson) { create(:congressperson) }
    let!(:expenses) { create_list(:expense, 3, congressperson_id: congressperson.id) }

    it { expect(Congressperson.count).to eq(1) }

    it { expect(Congressperson.first.expenses.count).to eq(3) }
  end
end
