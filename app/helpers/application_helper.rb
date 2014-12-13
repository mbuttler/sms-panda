module ApplicationHelper

	def title
		base_title = "SMS Panda"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

  def logo
    image_tag("panda.png", :alt => "SMS Panda App", :class => "round") 
  end
end