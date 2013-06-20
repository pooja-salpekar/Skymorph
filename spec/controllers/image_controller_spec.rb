require 'spec_helper'

describe ImageController do

  describe "GET request" do

    it "should assign a new ImageUrls as @image_url"  do
      image = stub_model Image
      Image.stub!(:new).and_return(image)
      get :new
      assigns[:image] == image
    end

    it "should assign a New Image as @page_name"  do
      get :new
      assigns[:page_name] == 'New Image'
    end

  end
end