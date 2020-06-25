require "google_drive"
require "googleauth"
require "dotenv"

Dotenv.load

class SpreadsheetConfig

  def initialize
    credentials = Google::Auth::UserRefreshCredentials.new(
      client_id: ENV["GOOGLE_AUTH_CLIENT_ID"],
      client_secret: ENV["GOOGLE_AUTH_CLIENT_SECRET"],
      scope: [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/",
      ],
      refresh_token: ENV["GOOGLE_AUTH_REFRESH_TOKEN"],
      additional_parameters: { "access_type" => "offline" },
    )
    session = GoogleDrive::Session.from_credentials(credentials)
    @sheet = session.spreadsheet_by_key(ENV["CHINESE_BOT_SPREADSHEET_URL"]).worksheets[0]
  end

  def read
    contents = []
    (2..@sheet.num_rows).each do |row|
      items = []
      (2..@sheet.num_cols).each_with_index do |col, index|
        item = @sheet[row, col]
        items.push(item)
      end
      contents.push(items)
    end
    contents
  end
end
