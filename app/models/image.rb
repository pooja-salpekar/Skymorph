class Image
  require "nokogiri"
  require "uri"
  require "net/http"

  def self.request_source(position, survey, options = {})
    query_params = {"position" => position, "survey" => survey}.merge(options)
    request = Net::HTTP.post_form(URI.parse(SOURCE_URL), query_params)
    page = request.body

    image_links = get_image_links(page)
    return format_links(image_links)
  end

  private

    ROOT_URL = "http://skyview.gsfc.nasa.gov/"
    SOURCE_URL = "#{ROOT_URL}/cgi-bin/runquery.pl"

    def self.get_image_links(html_page)
      links = []
      doc = Nokogiri::HTML(html_page)
      image_sources = doc.css('img')
      image_sources.each do |image|
        links << image['src']
      end
      return links
    end

    def self.format_links(links)
      links.each do |image_link|
        image_link.delete!("../") if image_link.start_with?("../")
        image_link.insert(0, ROOT_URL)
      end
      links
    end

end