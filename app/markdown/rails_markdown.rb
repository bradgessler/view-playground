class RailsMarkdown < BaseMarkdown
  include Rails.application.routes.url_helpers

  def image(link, title, alt)
    ApplicationController.helpers.image_tag link, title: title, alt: alt
  end
end
