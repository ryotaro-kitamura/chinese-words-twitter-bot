require "google_drive"

class SpreadsheetConfig
  def initialize
    session = GoogleDrive::Session.from_config("config.json")
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
