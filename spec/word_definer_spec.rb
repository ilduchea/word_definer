require 'word_definer'
require 'rspec'
require 'pry'

describe 'Word_definer' do
  it 'intializes a new word to be defined' do    
    expect(word = Word_definer.new({:word => "test"})).to eq (word)
  end
end
