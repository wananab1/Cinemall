module MoviesHelper
	def movie(opts)
	    iframe = content_tag(
	      	:iframe,
	        '', # empty body
	      	width: 691,
	      	height: 380,
	      	src: "https://www.youtube.com/embed/#{opts[:movie]}",
	      	frameborder: 0,
	      	allowfullscreen: true
	    )
	    content_tag(:div, iframe, class: 'youtube-container')
	end
end
