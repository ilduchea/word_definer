class Word_definer
  attr_accessor(:word)

  define_method(:initialize) do |atributes|
    @word = atributes.fetch(:word)
  end

end
