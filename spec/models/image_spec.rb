require 'spec_helper'

describe Image do
  it 'request should return body of html page' do
    image = Image.new
    Net::HTTP.should_receive(:post_form).and_return(mock(:body => "html body"))

    body = image.request

    body.should == 'html body'
  end

  it 'urls should return the formatted urls' do
    image = Image.new
    image.should_receive(:request).and_return("<img src= '/dummy_link'></img>")

    url = image.urls

    image['url'].length.should_not == 0
    url.should include("http://skyview.gsfc.nasa.gov/dummy_link")
  end
end