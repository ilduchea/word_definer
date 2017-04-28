class Word
  @@words = []
  attr_accessor(:word, :id)

  def initialize (atributes)
    @word = atributes.fetch(:word)
    @id = "word".+((@@words.length() + 1).to_s)
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

end
