require 'spec_helper'

describe "Static" do

  it "has About page" do
    visit about_path
    page.should have_title('About')
  end

end
