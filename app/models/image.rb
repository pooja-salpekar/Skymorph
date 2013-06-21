class Image < Hash
  require "nokogiri"
  require "uri"
  require "net/http"

  ROOT_URL = "http://skyview.gsfc.nasa.gov"
  SOURCE_URL = "#{ROOT_URL}/cgi-bin/runquery.pl"

  def initialize(args={})
    self['position'] = args['position'] || ''
    self['survey'] = args['survey'] || []
    self['url'] = args['url'] || []
  end

  def request
    query_params = self.except('url')
    request = Net::HTTP.post_form(URI.parse(SOURCE_URL), query_params)
    request.body
  end

  def urls
    add_urls request
    format_links
  end

  private

    def add_urls(page)
      doc = Nokogiri::HTML(page)
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