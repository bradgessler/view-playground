module LayoutHelper
  # Render a block within a layout. This is a useful, and prefered way, to handle
  # nesting layouts, within Sitepress.
  def render_layout(layout, **kwargs, &block)
    render html: capture(&block), layout: "layouts/#{layout}", **kwargs
  end
end