require 'word'
require 'rspec'
require 'pry'

describe 'Word' do
  it 'intializes a new word to be defined' do
    expect(word = Word.new({:word => "test"})).to eq (word)
  end

  describe '.all' do
    it 'returns an empty array initially' do
      expect(Word.all).to eq ([])
    end
  end

  describe '#save' do
    it 'will add a word to the words array' do
      word = Word.new({:word => "test"})
      word.save
      expect(Word.all).to eq ([word])
    end
  end

  describe '.clear' do
    it 'will empty the words array' do
      word = Word.new({:word => "test"})
      word.save
      Word.clear
      expect(Word.all).to eq ([])
    end
  end

  describe '#id' do
    it 'returns a unique id for each instance of Word' do
      word = Word.new({:word => "test"})
      expect(word.id).to eq ("word1")
    end
  end

  describe(".find") do
    it("returns a word by its id") do
      word = Word.new({:word => "test"})
      word.save()
      word2 = Word.new({:word => "test2"})
      word2.save()
      expect(Word.find(word.id())).to(eq(word))
    end
  end

end
