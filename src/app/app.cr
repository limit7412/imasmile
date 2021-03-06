require "json"
require "uri"
require "./module/*"

class App
  def initialize()
    @table = Table.new
  end

  def run
    idol = @table.get_idol
    slack = PostSlack.new(
      name: idol["name"],
      url: idol["webhook"],
      quote: idol["quote"]
    )

    return slack.post.body
    # return @table.test_dynamo
  end
end