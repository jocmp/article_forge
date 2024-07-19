require "sinatra"
require "rack"
require "./articles"
require "./color_picker"
require "securerandom"
require "liquid"

configure do
  Sinatra::Application.reset!
  use Rack::Reloader
end

get "/" do
  redirect to("/articles/nine_to_five_google")
end

get "/articles/:slug" do
  style = File.read("./public/stylesheet.css")

  article = Articles.find(params["slug"])

  colors = ColorPicker.pick(params["theme"])

  liquid :template, locals: {
    style:,
    title: article.title,
    byline: article.byline,
    external_link: article.external_link,
    feed_name: article.feed_name,
    body: article.body,
    text_size: article.text_size,
    script: article.script.to_s,
    resource_url: ""
  }.merge(colors)
end

get "/test-room" do
  colors = ColorPicker.pick(params["theme"])

  liquid :"test-room", locals: {
    unvisited_link: "https://example.com/#{SecureRandom.uuid}"
  }.merge(colors)
end
