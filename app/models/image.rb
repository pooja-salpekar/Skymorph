class Image
  require "nokogiri"
  require "uri"
  require "net/http"

  def self.request_source(position, survey, options = {})
    query_params = {"position" => position, "survey" => survey}.merge(options)
    request = Net::HTTP.post_form(URI.parse(SOURCE_URL), query_params)
    page = request.body

    image_links = get_image_links(page)
    return format_link(image_links)
  end

  private

    SOURCE_URL = "http://skyview.gsfc.nasa.gov/cgi-bin/runquery.pl"
    ROOT_URL = "http://skyview.gsfc.nasa.gov/"

    def self.get_image_links(html_page)
      links = []
      doc = Nokogiri::HTML(html_page)
      image_sources = doc.css('img')
      image_sources.each do |image|
        links << image['src']
      end
      return links
    end

    def self.format_link(links)
      links.each do |image_link|
         [ROOT_URL, image_link].join
      end
    end

end