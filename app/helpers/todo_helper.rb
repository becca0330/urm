module TodoHelper
  
  def sort_link_title(fieldname) # priority (updated_at, title, description, solved)
    img = session["sortimg_#{fieldname}"] || "sort_ascending.png"
    logger.info("sort_link_title for #{fieldname}: #{img}")
    result = link_to(   image_tag( img ) +
                        I18n.t(:"todos.tableheading_#{fieldname}"), 		# Prio
												todos_path(:sort => fieldname),
												:title => I18n.t(:"todos.tableheadinghint_#{fieldname}") # Sort by priority 
										 )
    return result
  end
end