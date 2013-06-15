require 'spec_helper'

describe ImageUrlsController do

  describe "GET request" do

    it "should assign a new ImageUrls as @image_url"  do
      url = stub_model ImageUrls
      ImageUrls.stub!(:new).and_return(url)
      get :new
      assigns[:image_url].should equal(url)
    end
  end
end