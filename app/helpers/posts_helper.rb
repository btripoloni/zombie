module PostsHelper
	def comments_size(post)
		pluralize(post.comments.size, t('post.comment'))
	end

	def resume_body(body)
		parsed_body = body.split(' ')
		if body.size > 100
			parsed_body.slice(0, 100).join(' ').html_safe << "..."
		else
			body
		end
	end
end
