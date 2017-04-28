require 'definition'
require 'rspec'
require 'pry'

describe 'Definition' do
  it 'intializes a new definition to be defined' do
    expect(definition = Definition.new({:definition => "test"})).to eq (definition)
  end

  describe '.all' do
    it 'returns an empty array initially' do
      expect(Definition.all).to eq ([])
    end
  end

  describe '#save' do
    it 'will add a definition to the definitions array' do
      definition = Definition.new({:definition => "test"})
      definition.save
      expect(Definition.all).to eq ([definition])
    end
  end

  describe '.clear' do
    it 'will empty the definitions array' do
      definition = Definition.new({:definition => "test"})
      definition.save
      Definition.clear
      expect(Definition.all).to eq ([])
    end
  end

  describe '#id' do
    it 'returns a unique id for each instance of Definition' do
      definition = Definition.new({:definition => "test"})
      expect(definition.id).to eq ("definition1")
    end
  end

  describe(".find") do
    it("returns a definition by its id") do
      definition = Definition.new({:definition => "test"})
      definition.save()
      definition2 = Definition.new({:definition => "test2"})
      definition2.save()
      expect(Definition.find(definition.id())).to(eq(definition))
    end
  end

end
