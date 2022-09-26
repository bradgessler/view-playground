class BaseMarkdown < Redcarpet::Render::HTML
  include Rails.application.routes.url_helpers

  def enable
    []
  end

  def renderer
    Redcarpet::Markdown.new(self.class, **features)
  end

  private
    def features
      Hash[Array(enable).map{ [ _1, true ]}]
    end
end
