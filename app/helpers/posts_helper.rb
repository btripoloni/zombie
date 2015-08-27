module PostsHelper
	def comments_size(post)
		pluralize(post.comments.size, t('post.comment'))
	end

	def resume_body(post)
		parsed_body = post.body_with_markdown.split(' ')
		if parsed_body.size > 100
			parsed_body.slice(0, 100).join(' ').html_safe << "[....]"
		else
			post.body_with_markdown
		end
	end

	def tag_helper(tag)
		tag_list = ""
		tag.each do |t|
			span = "<span class='label label-info'>#{t}</span>".html_safe
			tag_list << "#{link_to span, root_path} "
		end
		tag_list.html_safe
	end

	def comment_helper(post)
		unless post.comments.size == 0
			label = "label-info" 
		else
			label = "label-danger"
		end
		"<span class='label #{label}'>#{comments_size(post)}</span>".html_safe
	end
end
