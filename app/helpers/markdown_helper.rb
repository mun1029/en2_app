module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
        filter_html: true,
        hard_wrap: true,
        space_after_headers: true
      }
      extensions = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        strikethrough: true
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end
