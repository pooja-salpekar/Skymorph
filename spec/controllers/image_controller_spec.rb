require 'spec_helper'

describe ImageController do

  describe "GET request" do

    it "should assign a new ImageUrls as @image_url"  do
      image = stub_model Image
      Image.stub!(:new).and_return(image)
      get :new
      assigns[:image].should == image
    end

    it "should assign a New Image as @page_name"  do
      get :new
      assigns[:page_name].should == 'New Image'
    end

  end

  describe "POST request" do

    it "should create an image with given params" do
      image = Image.new({'position' => '10 12 12' , 'survey' => ['Gamma']})
      Image.should_receive(:new).and_return(image)

      post :find, {'position' => '10 12 12' , 'survey' => ['Gamma']}

      assigns[:image]['position'].should == '10 12 12'
      assigns[:image]['survey'].should == ['Gamma']
    end

    it "should call urls method on image" do
      image = Image.new({'position' => '10 12 12' , 'survey' => ['Gamma']})
      Image.should_receive(:new).and_return(image)

      image.should_receive(:request).and_return("<img src='/dummy_link'>")
      image.should_receive(:add_urls).and_return(image['url'] = ['dummy_link'])
      image.should_receive(:format_links).and_return(image['url'] = ['root/dummy_link'])

      post :find, {'position' => '10 12 12' , 'survey' => ['Gamma']}

      assigns[:image]['url'].should == ['root/dummy_link']
    end
  end
end