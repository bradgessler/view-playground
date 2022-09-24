module Views
  class Layout < Phlex::Component
    def initialize(title:)
      @title = title
    end

    def template(&)
      doctype

      html do
        head do
          link href: "/application.css", rel: "stylesheet"
          csp_meta_tag
          csrf_meta_tags
          title @title
        end

        body do
          main(&)
        end
      end
    end
  end
end
