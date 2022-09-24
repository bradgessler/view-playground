class ApplicationMarkdown < BaseMarkdown
  include Redcarpet::Render::SmartyPants

  def enable
    [:fenced_code_blocks]
  end

  def block_code(code, language)
    render_component Views::CodeBlock.new(code, syntax: language)
  end

  def image(link, title, alt)
    url = URI(link)
    case url.host
    when "www.youtube.com"
      render_component Views::YoutubeEmbed.new(url)
    else
      ApplicationController.helpers.image_url link, title: title, alt: alt
    end
  end

  private

  def render_component(component)
    component.call("")
  end
end
