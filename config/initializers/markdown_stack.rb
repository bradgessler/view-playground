# We cannot use Markdown::Rails because it conflicts with RDiscount's Markdown class
module MarkdownRails
  class Handler
    def initialize
    end

    def call(zemplate, source = template.source)
      renderer = ApplicationMarkdown.new
      renderer.render(source).inspect + '.html_safe'
    end
  end
end

handler = MarkdownRails::Handler.new

[:md, :markdown].each do |extension|
  ActionView::Template.register_template_handler extension, handler
end
