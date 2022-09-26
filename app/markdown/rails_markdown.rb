class RailsMarkdown < BaseMarkdown
  def image(link, title, alt)
    ApplicationController.helpers.image_tag link, title: title, alt: alt
  end
end
