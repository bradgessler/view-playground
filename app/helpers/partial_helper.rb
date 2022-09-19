module PartialHelper
  def partial(name, **locals)
    controller.class.render partial: name, locals: locals
  end
end
