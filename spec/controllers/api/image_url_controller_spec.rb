require 'spec_helper'

describe Api::ImageUrlsController do

  describe "GET request" do
    it "should call request and return new ImageUrl"  do
      ImageUrl.stub(:request).with('some_position', 'some_survey').and_return(image_url = ImageUrl.new)

      get :request, :format => :json

      @controller.should_receive(:request).and_return(image_url)
    end
  end
end