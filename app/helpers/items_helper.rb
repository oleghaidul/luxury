module ItemsHelper
  def next_item(id, brand)
    unless id == brand.items.last.id
      next_item = brand.items.where("items.id > ?", id).first
      link_to image_tag("rails.png"), item_path(next_item.id), :remote => true
    else
      link_to "&rArr;".html_safe,"#", :class => "arrow_end"
    end
  end

  def prev_item(id,brand)
    unless id == brand.items.first.id
      prev_item = brand.items.where("items.id < ?", id).last
      link_to image_tag("rails.png"), item_path(prev_item.id), :remote => true
    else
      link_to "&lArr;".html_safe, "#", :class => "arrow_end"
    end
  end
end
