require_relative "../../lib/markdown-rails"

# Restart your server after making changes to these files.
MarkdownRails::Handler.register :md do
  ApplicationMarkdown.new
end

MarkdownRails::ErbHandler.register :markerb do
  ApplicationMarkdown.new
end
