# frozen_string_literal: true

require "sass-embedded"

class StyleMinifier
  BASE_NAME = "stylesheet"

  def self.minify(destination: "public")
    compressed = Sass.compile("style/#{BASE_NAME}.scss", style: :compressed)

    File.write("#{destination}/#{File.basename("#{BASE_NAME}.css")}", compressed.css)
  end
end
