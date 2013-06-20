class ImageController < ApplicationController

  def index
  end

  def new
    @page_name = 'New Image'
    @image = Image.new
  end
end