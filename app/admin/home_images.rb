ActiveAdmin.register HomeImage do
  
  form :partial => 'form'

  show :title => :name do
    panel "Collection Details" do
      attributes_table_for home_image do
        row :name
        row :alt_name
        row :image
        row :timeout
      end
    end
  end

end
