module ItemsHelper
  def next_item(id, collection)
    unless id == collection.items.last.id
      next_item = collection.items.where("id > ?", id).first
      link_to "&rArr;".html_safe, item_path(next_item.id), :remote => true
    else
      link_to "&rArr;".html_safe,"#", :class => "arrow_end"
    end
  end

  def prev_item(id,collection)
    unless id == collection.items.first.id
      prev_item = collection.items.where("id < ?", id).last
      link_to "&lArr;".html_safe, item_path(prev_item.id), :remote => true
    else
      link_to "&lArr;".html_safe, "#", :class => "arrow_end"
    end
  end
end
