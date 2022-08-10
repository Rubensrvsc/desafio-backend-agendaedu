require 'rails_helper'

RSpec.describe Business::Repository do

  describe 'register records' do
    context 'test repository' do
        let!(:congressperson) { create(:congressperson) }
        let!(:expenses) { create_list(:expense, 3, congressperson_id: congressperson.id) }
        let!(:repo) { described_class.new }

        it { expect(repo.sum_expenses_congressperson(congressperson.id)).to be_kind_of(Float) }
        it { expect(repo.get_ide_Cadastro(congressperson.id)).to eq(congressperson.id) }
        it { expect(repo.get_max_expense(congressperson.id)).to be_kind_of(Float)}
    end
  end
end
