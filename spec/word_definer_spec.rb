require 'word_definer'
require 'rspec'
require 'pry'

describe 'Word_definer' do
  it 'intializes a new word to be defined' do
    expect(word = Word_definer.new({:word => "test"})).to eq (word)
  end

  describe '.all' do
    it 'returns an empty array initially' do
      expect(Word_definer.all).to eq ([])
    end
  end

  describe '#save' do
    it 'will add a word to the words array' do
      word = Word_definer.new({:word => "test"})
      word.save
      expect(Word_definer.all).to eq ([word])
    end
  end

  describe '.clear' do
    it 'will empty the words array' do
      word = Word_definer.new({:word => "test"})
      word.save
      Word_definer.clear
      expect(Word_definer.all).to eq ([])
    end
  end

  describe '#id' do
    it 'returns a unique id for each instance of Word_definer' do
      word = Word_definer.new({:word => "test"})
      expect(word.id).to eq ("word1")
    end
  end

  describe(".find") do
    it("returns a word by its id") do
      word = Word_definer.new({:word => "test"})
      word.save()
      word2 = Word_definer.new({:word => "test2"})
      word2.save()
      expect(Word_definer.find(word.id())).to(eq(word))
    end
  end

end
