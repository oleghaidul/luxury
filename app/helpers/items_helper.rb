module ItemsHelper
  def next_item(id)
    unless id == Item.last.id
      if Item.find(id)
        link_to "&rArr;".html_safe, item_path(id+1), :remote => true
      else
        next_item(id+1)
      end
    else
      link_to "&rArr;".html_safe,"#", :class => "arrow_end"
    end
  end

  def prev_item(id)
    unless id == Item.first.id
      if Item.find(id)
        link_to "&lArr;".html_safe, item_path(id-1), :remote => true
      else
        next_item(id-1)
      end
    else
      link_to "&lArr;".html_safe, "#", :class => "arrow_end"
    end
  end
end
