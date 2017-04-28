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

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  erb(:word)
end

post('/add_definition') do
  definition = params.fetch('definition')
  @word = Word.find(params.fetch("id"))
  @word.add_definition(definition)
  redirect("/words/#{@word.id()}")
end
