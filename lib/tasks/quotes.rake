require 'csv'

namespace :quotes do
  desc "Import quotes from /config/quotes/quotes.csv."
  task :import => :environment do
    quotes_csv = Rails.root.join('config/quotes/quotes.csv')
    
    # Import
    CSV.foreach(quotes_csv) do |rec|
      Quote.create(:quote => rec[0].strip, :author => rec[1].strip, :approved => true)
    end
    
    # Cleanup
    File.delete(quotes_csv)
  end
end