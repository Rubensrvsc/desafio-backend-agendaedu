require 'rails_helper'

RSpec.describe CongressController, type: :controller do

  describe "Some features" do

    context 'test imported csv' do
      let!(:congressperson) { create(:congressperson) }
      let!(:expenses) { create_list(:expense, 3, congressperson_id: congressperson.id) }

      it "csv  imported" do
        path = Rails.root.join('spec/upload/ano-2021.csv')
        post :csv, params: { csv: path }
  
        expect(flash["alert"]).to eq("Já foi importado um csv")
      end
    end
  end
end
