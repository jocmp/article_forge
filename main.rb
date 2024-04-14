require 'sinatra'
require 'rack'
require './articles'

configure do
  Sinatra::Application.reset!
  use Rack::Reloader
end

get '/' do
  redirect to('/nine_to_five_google')
end

get '/articles/:slug' do
  style = File.read('./public/stylesheet.css')

  article = Articles.find(params['slug'])

  erb :template, locals: {
    style: style,
    title: article.title,
    byline: article.byline,
    external_link: article.external_link,
    body: article.body,
    text_size: article.text_size,
  }
end

get '/test-room' do
  erb :'test-room'
end
