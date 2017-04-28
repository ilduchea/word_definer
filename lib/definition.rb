class Definition
  @@definitions = []
  attr_accessor(:def, :id)

  def initialize (atributes)
    @def = atributes.fetch(:def)
    @id = "definition".+((@@definitions.length() + 1).to_s)
  end

  def self.all
    @@definitions
  end

  def save
    @@definitions.push(self)
  end

  def self.clear
    @@definitions = []
  end

  def self.find (id)
    found_definition = nil
    @@definitions.each do |definition|
      if definition.id().eql?(id)
        found_definition = definition
      end
    end
    found_definition
  end
end
