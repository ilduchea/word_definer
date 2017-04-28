require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require "./lib/definition"
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:index)
end

post('/word') do
  word = params.fetch('word')
  @word = Word.new({:word => word})
  @word.save
  redirect('/')
end

post('/clear') do
  Word.clear
  redirect('/')
end

get('/search') do
  word = params.fetch('search')
  @word = Word.search(word)
  redirect("/words/#{@word.id()}")
end

get('/random') do
  @word = Word.random_word()
  redirect("/words/#{@word.id()}")
end

post('/alphabetize') do
  Word.alphabetize
  redirect('/')
end

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  erb(:word)
end

post('/add_definition') do
  @word = Word.find(params.fetch("id"))
  definition = params.fetch('definition')
  if definition.length > 0
    @word.add_definition(definition)
  end
  redirect("/words/#{@word.id()}")
end

get('/display_all') do
  @words = Word.all
  erb(:all_words)
end
