class ImageController < ApplicationController

  def new
    @page_name = 'New Image'
    @image = Image.new
  end

  def find
    @image = Image.new(params[:image])
    @image.urls

    render :text => "this is just for now"
  end

end