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
