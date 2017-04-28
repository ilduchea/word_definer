require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Word Definer paths', {:type => :feature}) do
  it('goes to home page and creates a word') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Add Word')
    expect(page).to have_content('test')
  end

  it('goes to home page, creates a word and clears all words') do
    visit('/')
    fill_in('word', :with => 'Hello')
    click_button('Add Word')
    click_button('Remove all Words')
    expect(page).to have_no_content('Hello')
  end
end
