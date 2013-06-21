require 'spec_helper'

describe Image do
  it 'request should return body of html page' do
    image = Image.new
    Net::HTTP.should_receive(:post_form).and_return(mock(:body => "html body"))

    body = image.request

    body.should == 'html body'
  end
end