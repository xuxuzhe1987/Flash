class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :download_csv ]

  def home
  end

  def download_csv
    template_path = Rails.root.join('public', 'cards_import.csv')
    
    unless File.exist?(template_path)
      File.open(template_path, 'wb') do |file|
        file.write("question,answer\nWhat is Ruby?,A programming language\nWhat is Rails?,A web application framework\n")
      end
    end

    send_file template_path, 
      filename: "flash_cards_template.csv", 
      type: "text/csv"
  end
end