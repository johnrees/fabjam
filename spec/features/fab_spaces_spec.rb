require 'spec_helper'

describe "FabSpaces" do

  it "has fab_spaces list" do
    FactoryGirl.create(:fab_space, name: 'fab lab barcelona')
    visit fab_spaces_path
    expect(page).to have_title('Fab Spaces')
    expect(page).to have_link('fab lab barcelona')
  end

  it "has fab_space page" do
    fab_space = FactoryGirl.create(:fab_space, name: 'fab lab barcelona')
    visit fab_space_path(fab_space)
    expect(page).to have_title('fab lab barcelona')
  end

  it "can edit fab_space" do
    fab_space = FactoryGirl.create(:fab_space, name: 'fab lab barcelona')
    visit edit_fab_space_path(fab_space)
    fill_in :name, with: 'new name'
    click_button 'Update Fab Space'
    expect(page).to have_content('new name')
  end

end
