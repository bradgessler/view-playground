module StrictPartialHelper
  def strict_partial(template, **locals)
    @__locals__  = locals
    render partial: template, locals: locals
  end

  def strict(locals: @__locals__, **keywords)
    keywords.each do |keyword, default|
      locals[keyword] ||= default
    end
  end
end
