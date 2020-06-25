require "./config/twitter_config.rb"
require "./config/spreadsheet_config.rb"

class AutoTweetScript
  def initialize
    @twitter = TwitterConfig.new.call
    @spredsheet = SpreadsheetConfig.new
  end

  def tweet
    begin
      contents = @spredsheet.read
      index = rand(0..contents.size - 1)
      tweet = "【生词】#{contents[index][0]}\n\n【拼音】#{contents[index][1]}\n【日文】#{contents[index][2]}"
      @twitter.update("#{tweet}")
      p "done"
    rescue
      p "error"
    end
  end
end

AutoTweetScript.new.tweet
