require "phlex/rails"

class PhlexController < ApplicationController
  phlex_layout Views::Layout.new title: "Phlex is Phun!"l do
    h1 "Hello!"
  end

  def index
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

  def self.phlex_layout(component)
    @_phlex_layout = component
  end
end
