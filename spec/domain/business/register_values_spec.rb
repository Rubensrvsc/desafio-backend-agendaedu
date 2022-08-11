require 'rails_helper'

RSpec.describe Business::RegisterValues do

  describe '#flow' do
    context 'when flow works' do
        let!(:path) { Rails.root.join('spec/upload/ano-2021.csv') }
        let!(:ext) { File.extname(path) }
        let!(:file_name) { "#{SecureRandom.urlsafe_base64}#{ext}" }
        let!(:new_dir) { FileUtils.mkdir_p(Rails.root.join("spec/upload/file/")) }
        let!(:file_name_path) { Rails.root.join("spec/upload/file/", file_name) }
        let!(:write_csv) do
            File.open(file_name_path, "wb") { |f| f.write(path.read) }
        end

        let(:subject) { described_class.new.call(file_name_path) }

        it { expect(subject.success?).to be_truthy }

        it { expect(subject.value!).to eq('Arquivo deletado com sucesso') }
    end
  end
end
