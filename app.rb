require 'sinatra'
require 'sinatra/reloader'
require './lib/kids_website'
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @terms = Word.all
  erb(:index)
end

get('/add_term') do
  erb(:form)
end

post('/add_term_submit') do
  entered_term = params.fetch('input-term')
  entered_def = params.fetch('input-def')
  new_term = Word.new(entered_term)
  new_term.save
  if entered_def != ""
    new_def = Definition.new(entered_def)
    new_term.add_def(new_def)
  end
  @terms = Word.all
  erb(:index)
end

get('/term/:id') do
  @term = Word.find(params.fetch('id').to_i)
  erb(:term)
end

post('/term/:id') do
  @term = Word.find(params.fetch('id').to_i)
  entered_def = params.fetch('input-new-def')
  new_def = Definition.new(entered_def)
  @term.add_def(new_def)
  erb(:term)
end
