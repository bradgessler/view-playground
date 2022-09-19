# View Playground

I'm going to start playing around with Rails views to see how we can do better.

Generally, people run into problems with instance variables. Their scope is too global, especially for complex views and large Rails apps, which creates implicit dependencies that are hard to debug.

Most of the late component libraries that have become available to Rails, like [ViewComponent](https://viewcomponent.org), were created to solve this problem.

## Isolate partials from instance variables with `partial`

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

## Compose templates with `render_layout`

One of the most brilliant parts of Middleman is the [`wrap_layout`](https://middlemanapp.com/basics/layouts/#nested-layouts) method. It makes it possible to better compose layouts in other layouts, or call it directly from a view. I use it extensively [Sitepress](https://sitepress.cc) because it makes it insanely easy to build up a hiearchy of layouts. Usually I structure mine as follows:

*   [body.html.erb](./app/views/layouts/body.html.erb) - This has the root `html` tag, my `head` tag that I use all over, and a `body` tag with a `yield` stuck it in. Nothing more.

    ```erb
    <!DOCTYPE html>
    <html>
      <head>
        <title>ViewPlayground</title>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <%= csrf_meta_tags %>
        <%= csp_meta_tag %>

        <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
        <%= javascript_importmap_tags %>
      </head>

      <body>
        <%= yield %>
      </body>
    </html>
    ```

*   [application.html.erb](./app/views/layouts/application.html.erb) - For this demo I have the `header` and `footer` tags. Stuff you'd expect for **most** of the website.

    ```erb
    <%= render_layout "body" do %>
      <header>
        <h1>The International Website of Pancakes 🥞<h1>
      </header>
      <%= yield %>
      <footer>
        Brad was hungry when he created this demo app in 2022
      </footer>
    <% end %>
    ```

*   [pancakes.html.erb](./app/views/layouts/pancakes.html.erb) - For this demo I have a more specific layout for the pancakes controller that injects an obsence amount of "🥞🥞🥞" into the view.

    ```erb
    <%= render_layout "application" do %>
      <p>
        🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞
      </p>
      <article class="🥞🥞">
        <%= yield %>
      </article>
      <p>
        🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞🥞
      </p>
    <% end %>
    ```

    You wouldn't want to display this many pancakes on other parts of the website, like the "Terms of Service" where attorneys would frown at such a large display of pancakes. If a judge ever saw that amount of pancakes in the court of law, you'd get thrown in the slammer for sure. You'd want something more like this:

    ```erb
    <%= render_layout "application" do %>
      <h2>Super boring legal stuff 👩‍⚖️</h2>
      <article>
        <%= yield %>
      </article>
    <% end %>
    ```

    Why go through the trouble? Sometimes you don't want to render the `header` and `footer` tags of a website, for example on an e-commerce checkout page, but you do want to use the same `html > head|body` tags. Instead of copy and pasting, as most people do, just wrap it in the `render_layout` method and DRY up your templates.

## Replace the Rails layout & template stack with a component library like Phlex or ActionView

Stay tuned! I'll give it a go with both frameworks and see what happens.