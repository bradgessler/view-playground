class ApplicationMarkdown < BaseMarkdown
  include Redcarpet::Render::SmartyPants

  def enable
    [:fenced_code_blocks]
  end

  def block_code(code, language)
    Views::CodeBlock.new(code, syntax: language).call
  end

  def image(link, title, alt)
    url = URI(link)
    case url.host
    when "www.youtube.com"
      Views::YoutubeEmbed.new(url).call
    else
      ApplicationController.helpers.image_url link, title: title, alt: alt
    end
  end
end
