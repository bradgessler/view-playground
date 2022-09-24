class ApplicationMarkdown < BaseMarkdown
  include Redcarpet::Render::SmartyPants

  def block_code(code, language)
   rouge code, language
  end

  def rouge(code, language)
    return code unless language
    formatter = Rouge::Formatters::HTML.new
    formatter.format Rouge::Lexer.find(language).lex(code)
  end

  def enable
    [:fenced_code_blocks]
  end

  def image(link, title, alt)
    url = URI(link)
    case url.host
    when "www.youtube.com"
      <<~YOUTUBE_TAG
      <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/#{CGI.parse(url.query).fetch("v").first}" title="YouTube video player" frameborder="0" allow="encrypted-media; picture-in-picture" allowfullscreen></iframe>
    YOUTUBE_TAG
    else
      ApplicationController.helpers.image_url link, title: title, alt: alt
    end
  end
end
