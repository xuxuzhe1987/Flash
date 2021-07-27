class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def download_csv
    send_file(
      "#{Rails.root}/public/cards_import.csv",
      filename: "cards_import.csv",
      type: "application/csv"
    )
  end
end
