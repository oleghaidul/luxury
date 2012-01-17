ActiveAdmin.register Boutique do

	controller do
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@boutique = Boutique.find_by_url_bout(params[:id])
		end
	end

	controller.authorize_resource
  index do
    column :name
    column :phone
    column :phone2
    column :director
    column :address
    column :url_bout
    default_actions
  end

  show do
    h3 boutique.name
    div do
      simple_format boutique.phone
      simple_format boutique.address
    end
    div do
      if boutique.image?
        image_tag boutique.image.url
      end
    end
  end


  form :partial => 'form'


end
