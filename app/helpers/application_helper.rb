module ApplicationHelper
	def text_with_markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		text = Sanitize.clean(text, remove_contents: %w(script))
		markdown.render(text).html_safe
	end
end
