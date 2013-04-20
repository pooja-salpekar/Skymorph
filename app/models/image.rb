class Image
  require "nokogiri"
  require "uri"
  require "net/http"

  IMAGE_SOURCE_URL = "http://skyview.gsfc.nasa.gov/cgi-bin/runquery.pl"

  def request(position, survey, options = {})
    query_params = {"position" => position, "survey" => survey}.merge(options)
    request = Net::HTTP.post_form(URI.parse(IMAGE_SOURCE_URL), query_params)

    return request.body
  end

  def get_source(html_page)
    doc = Nokogiri::HTML(html_page)
  end
end