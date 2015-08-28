module ApplicationHelper
	def text_with_markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		text = Sanitize.clean(text, remove_contents: %w(script))
		markdown.render(text).html_safe
	end
	
	def gravatar_image(size = 15)
		gravatar_image_url(current_author.email, filetype: :png, rating: 'pg', size: size, secure:false )
	end
end
