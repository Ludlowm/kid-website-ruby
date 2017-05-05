require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adds a word to the list of terms", {:type => :feature}) do
  it("adds a word to the terms list 'Shark'") do
    visit("/add_term")
    fill_in("input-term", :with => 'Shark')
    click_button("Submit")
    expect(page).to(have_content("Word Finder! Shark Word List Add A Word"))
  end
end

describe("adds a new definition to the list of terms", {:type => :feature}) do
  it("adds a  new definition to the word") do
    visit("/term/1")
    fill_in("input-new-def", :with => 'a cool animal in the ocean')
    click_button("Submit")
    expect(page).to(have_content('a cool animal in the ocean'))
  end
end
