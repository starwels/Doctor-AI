require 'redcarpet'

class MarkdownRenderer
  def initialize
    @renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    @markdown = Redcarpet::Markdown.new(@renderer, {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true
    })
  end

  def render(text)
    @markdown.render(text).html_safe
  end
end