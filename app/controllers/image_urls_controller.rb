class ImageUrlsController < ApplicationController

  def index
  end

  def new
    @image_url = ImageUrls.new
  end
end