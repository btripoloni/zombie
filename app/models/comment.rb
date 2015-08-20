class Comment < ActiveRecord::Base
	belongs_to :post
	def comment_with_markdown
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		text = Sanitize.clean(comment, remove_contents: %w(script))
		markdown.render(text).html_safe
	end
end
