module ApplicationHelper
 
  def submit_or_cancel(form)
     form.submit + " or " + link_to('Cancel', 'javascript:history.go(-1);', :class => 'cancel')
  end
  
end
