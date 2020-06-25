require "twitter"

class TwitterConfig
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CHINESE_BOT_TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["CHINESE_BOT_TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["CHINESE_BOT_TWITTER_CONSUMER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["CHINESE_BOT_TWITTER_CONSUMER_ACCESS_TOKEN_SECRET"]
    end
  end

  def call
    @client
  end
end
