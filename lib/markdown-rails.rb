# We cannot use Markdown::Rails because it conflicts with RDiscount's Markdown class
module MarkdownRails
  class Handler
    def initialize(extensions:, &block)
      @markdown = block
      Array(extensions).each { |extension| register_template_handler extension }
    end

    def call(template, source = template.source)
      renderer.render(source).inspect + '.html_safe'
    end

    def self.register(*extensions, &block)
      new extensions: extensions, &block
    end

    private

    def markdown
      @cache = nil unless Rails.configuration.cache_classes
      @cache ||= @markdown.call
    end

    def renderer
      @renderer = nil unless Rails.configuration.cache_classes
      @renderer ||= markdown.renderer
    end

    def register_template_handler(extension)
      ActionView::Template.register_template_handler extension, self
    end
  end

  class ErbHandler < Handler
    def call(template, source = template.source)
      compiled_source = compile_erb template, source
      # TODO: This won't properly handle initializer blocks. Somehow
      # I need to pass a reference to the block that's passed in.
      "#{markdown.class.name}.new.renderer.render(begin;#{compiled_source};end).html_safe"
    end

    private

    def compile_erb(template, source)
      ActionView::Template.registered_template_handler(:erb).call(template, source)
    end
  end
end
