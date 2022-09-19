# View Playground

I'm going to start playing around with Rails views to see how we can do better.

Generally, people run into problems with instance variables. Their scope is too global, especially for complex views and large Rails apps, which creates implicit dependencies that are hard to debug.

Most of the late component libraries that have become available to Rails, like [ViewComponent](https://viewcomponent.org), were created to solve this problem.

## Don't render instance variables with the `partial` method

Leaking instance variables into partials is bad.

* https://andycroll.com/ruby/dont-use-instance-variables-in-partials/
* https://biggerpockets.github.io/patterns/rails/no-instance-vars-in-partials-or-helpers

The [`partial_helper`](./app/helpers/partial_helper.rb) file solves that problem by isolating the view context of the partial renderer, which eliminates the instance variable.

In your code you'd replace instances of the `render` method:

```ruby
<%= render "form", pancake: @pancake %>
```

with the `partial` method:

```ruby
<%= partial "form", pancake: @pancake %>
```

Now when you call the method it won't leak instance varialbes, yay! They're all `nil` now!

## Replace the Rails layout & template stack with a component library like Phlex or ActionView

Stay tuned! I'll give it a go with both frameworks and see what happens.