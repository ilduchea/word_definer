class Word
  @@words = []
  attr_accessor(:word, :id, :definitions)

  def initialize (atributes)
    @word = atributes.fetch(:word)
    @id = "word".+((@@words.length() + 1).to_s)
    @definitions = []
  end

  def self.all
    @@words
  end

  def save
    @@words.push(self)
  end

  def self.clear
    @@words = []
  end

  def self.find (id)
    found_word = nil
    @@words.each do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end

  def add_definition (definition)
    @definitions.push(definition)
  end

  def self.alphabetize
    @@words.sort_by!(&:word)
  end

  def self.random_word
    random_array = @@words.shuffle
    word = random_array[0]
  end

  def self.search (search_value)
    found_word = nil
    @@words.each do |word|
      if word.word().eql?(search_value)
        found_word = word
      end
    end
    found_word
  end

end
