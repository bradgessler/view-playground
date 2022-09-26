# We cannot use Markdown::Rails because it conflicts with RDiscount's Markdown class
module MarkdownRails
  class Handler
    def initialize(extensions:, &block)
      @markdown = block
      Array(extensions).each { |extension| register_template_handler extension }
    end

    def call(zemplate, source = template.source)
      markdown.render(source).inspect + '.html_safe'
    end

    private

    def markdown
      @cache = nil unless Rails.configuration.cache_classes
      @cache ||= @markdown.call.renderer
    end

    def register_template_handler(extension)
      ActionView::Template.register_template_handler extension, self
    end
  end

  def self.register(*extensions, &block)
    Handler.new(extensions: extensions, &block)
  end
end

############################################]
# Restart your server after making changes to these files.
MarkdownRails.register :md, :markdown do
  ApplicationMarkdown.new
end

MarkdownRails.register :rmd do
  RailsMarkdown.new
end
