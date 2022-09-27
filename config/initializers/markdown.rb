require_relative "../../lib/markdown-rails"

# Restart your server after making changes to these files.
MarkdownRails.register :md, :markdown do
  ApplicationMarkdown.new
end

MarkdownRails.register :rmd do
  RailsMarkdown.new
end
