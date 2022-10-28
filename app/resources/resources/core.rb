module Resources
  class Core < ActionController::Metal
    # Render views, etc.
    include AbstractController::Rendering
    include ActionView::Layouts
    append_view_path "#{Rails.root}/app/views"

    # Redirects, URLs, etc.
    include ActionController::Redirecting
    include Rails.application.routes.url_helpers

    def perform
      view_paths.each { |path| append_view_path path }
      self.content_type = request.format
      self.public_send request.format.to_sym
    end

    def scope
      ::Pancake
    end

    def param_key
      :pancake
    end

    def view_paths
      action_path = self.class.name.split("::").map(&:underscore)
      *controller_path, _ = action_path
      [ action_path, controller_path ].map{ |segments| File.join("app/resources", *segments) }
    end

  end
end
