class BaseMarkdown < Redcarpet::Render::HTML
  include Rails.application.routes.url_helpers

  def enable
    []
  end

  def render(doc)
    renderer.render(doc)
  end

  private
    def renderer
      Redcarpet::Markdown.new(self.class, **features)
    end

    def features
      Hash[Array(enable).map{ [ _1, true ]}]
    end
end
