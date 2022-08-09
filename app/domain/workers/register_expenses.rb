require 'csv'

module Workers
    class RegisterExpenses
        include Sidekiq::Worker
        sidekiq_options retry: true
        def perform(csv_path)
            Business::RegisterValues.new.call(csv_path)
        end
    end
end