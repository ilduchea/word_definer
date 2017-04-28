require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Word Definer paths', {:type => :feature}) do
  before() do
    Word.clear()
  end

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

  it('goes to a words page via the home page') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Add Word')
    click_on('test')
    expect(page).to have_content('Definitions')
  end

  it('adds a definition to a word') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Add Word')
    click_on('test')
    fill_in('definition', :with => 'def def def def')
    click_on('Add Definition')
    expect(page).to have_content('def def def def')
  end

  it('returns the word searched for') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Add Word')
    fill_in('word', :with => 'qwerty')
    click_button('Add Word')
    fill_in('word', :with => 'animal')
    click_button('Add Word')
    fill_in('search', :with => 'animal')
    click_on('Search')
    expect(page).to have_content('animal')
  end
end
