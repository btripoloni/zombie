class Comment < ActiveRecord::Base
	validates_presence_of :name, :email, :comment

	belongs_to :post
	def comment_with_markdown
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		text = Sanitize.clean(comment, remove_contents: %w(script))
		markdown.render(text).html_safe
	end
end
