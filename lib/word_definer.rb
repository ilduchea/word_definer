class Word_definer
  @@words = []
  attr_accessor(:word)

  define_method(:initialize) do |atributes|
    @word = atributes.fetch(:word)
  end

  def self.all
    @@words
  end

  def save
    @@words.push(self)
  end

  # def id
  #   @id
  # end

end
