module Views
  class YoutubeEmbed < Phlex::Component
    def initialize(url)
      @url = URI(url)
      @embed_url = "https://www.youtube-nocookie.com/embed/#{CGI.parse(@url.query).fetch("v").first}"
    end

    def template
      iframe width: 560,
        height: 325,
        src: @embed_url,
        allow: "encrypted-media; picture-in-picture",
        allowfullscreen: true
    end
  end
end
