---
title: Rails View Playground
---

Howdy! This is the Rails View Playground, a place for kids, pancakes, and soon, waffles.

What makes this so special? Well for starters this is a markdown file that you can edit on-the-fly.

That means you can take a chunk of markdown like this:

```md
![Pancake video](https://www.youtube.com/watch?v=BPl7D20F2mE)
```

and make it emit the HTML you'd expect for a video.

![Pancake video](https://www.youtube.com/watch?v=BPl7D20F2mE)

Through a chunk of code that looks like this:

```ruby
def image(link, title, alt)
  url = URI(link)
  case url.host
  when "www.youtube.com"
    render_component Views::YoutubeEmbed.new(url)
  else
    ApplicationController.helpers.image_url link, title: title, alt: alt
  end
end
```