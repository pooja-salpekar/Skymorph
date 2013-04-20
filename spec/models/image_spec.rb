require 'spec_helper'

describe Image do

  it "should add domain name to link" do
    links = ["first_link", "second_link"]

    formatted_links = Image.format_links(links)

    formatted_links.should == ["http://skyview.gsfc.nasa.gov/first_link", "http://skyview.gsfc.nasa.gov/second_link"]
  end

  it "should remove unnecessary characters from url" do
    link = ["../some_link"]

    formatted_link = Image.format_links(link)

    formatted_link.should == ["http://skyview.gsfc.nasa.gov/some_link"]
  end

  xit "should return image url from html" do

  end

end