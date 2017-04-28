require 'word'
require 'definition'
require 'rspec'
require 'pry'

describe 'Word' do
  before() do
    Word.clear()
  end

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

  describe '.find' do
    it 'returns a word by its id' do
      word = Word.new({:word => "test"})
      word.save()
      word2 = Word.new({:word => "test2"})
      word2.save()
      expect(Word.find(word.id)).to eq (word)
    end
  end

  describe '#add_definition' do
    it 'adds a definition to the word' do
      word = Word.new({:word => "test"})
      definition = Definition.new({:def => "test"})
      word.add_definition(definition)
      expect(word.definitions).to eq ([definition])
    end
  end

  describe '.alphabetize' do
    it 'sorts the words alphabetically' do
      word = Word.new({:word => "qwerty"})
      word.save()
      word2 = Word.new({:word => "test"})
      word2.save()
      word3 = Word.new({:word => "animal"})
      word3.save()
      expect(Word.alphabetize()).to eq ([word3, word, word2])
    end
  end

  describe '.random_word' do
    it 'returns a random word' do
      word = Word.new({:word => "qwerty"})
      word.save()
      word2 = Word.new({:word => "test"})
      word2.save()
      word3 = Word.new({:word => "animal"})
      word3.save()
      srand 0
      random_word1 = Word.random_word
      srand 1
      random_word2 = Word.random_word
      expect(random_word1).not_to eq (random_word2)
    end
  end

end
