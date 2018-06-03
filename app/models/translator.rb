class Translator

  def translate(text, target = "ja", source = "en")
      url = api_url
      params = {
        q: text,
        target: target,
        source: source,
        key: ENV['GOOGLE_API_KEY'],
      }
      url.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(url)

      JSON.parse(response.body)["data"]["translations"].first["translatedText"]
  end

  private

  def api_url
    URI.parse('https://www.googleapis.com/language/translate/v2')
  end

end