module ItemsHelper
  def next_item(id)
    unless id == Item.last.id
      if Item.find(id)
        link_to "", item_path(id+1), :remote => true, :html => {:"data-spinner" => "#user_form_spinner"}
      else
        next_item(id+1)
      end
    else
      link_to "End", "#"
    end
  end

  def prev_item(id)
    unless id == Item.first.id
      if Item.find(id)
        link_to "", item_path(id-1), :remote => true
      else
        next_item(id-1)
      end
    else
      link_to "End", "#"
    end
  end
end
