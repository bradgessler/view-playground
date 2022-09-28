# Restart your server after making changes to these files.
Markdown::Rails.handle :md do
  ApplicationMarkdown.new
end

Markdown::Rails.handle :markerb, with: Markdown::Rails::Handlers::Erb do
  ApplicationMarkdown.new
end
