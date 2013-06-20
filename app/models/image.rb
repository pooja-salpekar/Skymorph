class Image < Hash
  require "nokogiri"
  require "uri"
  require "net/http"

  ROOT_URL = "http://skyview.gsfc.nasa.gov/"
  SOURCE_URL = "#{ROOT_URL}/cgi-bin/runquery.pl"

  def initialize
    self['position'] = ''
    self['survey'] = []
    self['url'] = []
  end

  def self.request
    query_params = self.except!('url')
    request = Net::HTTP.post_form(URI.parse(SOURCE_URL), query_params)
    page = request.body

    add_urls(page)
    format_links
  end

  private

    def add_urls(html_page)
      doc = Nokogiri::HTML(html_page)
      image_sources = doc.css('img')

      image_sources.each do |image|
        self['url'] << image['src']
      end

    end

    def format_links()
      self['url'].each do |url|
        url.delete!("../") if url.start_with?("../")
        url.insert(0, ROOT_URL)
      end
    end

end