class ImageUrlsController < ApplicationController

  def index
  end

  def new
    @page_name = 'New Image'
    @image_url = ImageUrls.new
  end
end