require 'rails_helper'

RSpec.describe Congressperson, type: :model do
  context 'testing model congressperson' do
    let!(:congressperson) { create_list(:congressperson, 5) }

    it { expect(Congressperson.count).to eq(5) }
  end
end
