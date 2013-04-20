class Source
  require "nokogiri"
  require "uri"
  require "net/http"

  def self.request(position, survey, options = {})
    query_params = {"position" => position, "survey" => survey}.merge(options)
    request = Net::HTTP.post_form(URI.parse(SOURCE_URL), query_params)
    page = request.body
    return get_links(page)
  end

  private

    SOURCE_URL = "http://skyview.gsfc.nasa.gov/cgi-bin/runquery.pl"

    def get_links(html_page)
      links = []
      doc = Nokogiri::HTML(html_page)
      image_sources = doc.css('img')
      image_sources.each do |img|
        img['src'] << links
      end
      return links
    end

end