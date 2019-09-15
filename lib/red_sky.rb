module RedSky
  def self.product(id)
    json = json(:post, "pdp/tcin/#{id}") do |req|
      req.params['excludes'] = 'taxonomy,price,promotion,bulk_ship,rating_and_review_reviews,rating_and_review_statistics,question_answer_statistics'
    end

    if json
      {name: json.dig("product", "item", "product_description", "title")}
    end
  end

  private

  def self.json(http_method, path)
    connection = Faraday.new(url: "http://redsky.target.com/v2/#{path}") do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.use FaradayMiddleware::FollowRedirects

      conn.adapter Faraday.default_adapter
    end

    response = connection.send(http_method) do |req|

      req.headers["Content-Type"] = "application/x-www-form-urlencoded"
      req.headers["Accept"] = "application/json"

      yield req
    end

    if response.status == 200
      response.body
    else
      Rails.logger.error("RedSky response error: #{response}")
      nil
    end
  end
end