class Post < ActiveRecord::Base
	has_many :comments
	validates_presence_of :title, :body
	self.per_page = 10
	acts_as_taggable

	def time
		created_at.strftime("%Y-%m-%d at: %H:%M:%S")
	end

	def body_with_markdown
		text = Sanitize.clean(body, remove_contents: %w(script))
		create_markdown(text)
	end

	def to_param
		"#{id}-#{title}"
	end

	private
	def create_markdown(data)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		markdown.render(data).html_safe
	end

end
