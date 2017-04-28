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
end
