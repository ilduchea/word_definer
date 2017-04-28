class Word_definer
  @@words = []
  attr_accessor(:word)

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

  def id
    @id
  end

end
