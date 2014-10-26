require 'spec_helper'

feature "User browses list of all peeps" do

  before(:each) do
    Peep.create(:name => "Foo Bar",
                :username => "foobar",
                :content => "Hello world!")
  end

  scenario "when opening the home page" do
    visit '/'
    # save_and_open_page
    expect(page).to have_content("Hello world!")
  end

end
