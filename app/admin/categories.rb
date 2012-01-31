ActiveAdmin.register Category do
  
  index do
    column :name
    column :name_eng
    default_actions
  end

  controller do
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@category = Category.find(params[:id])
		end
	end

  controller.authorize_resource

  show do
    h3 category.name
  end
  

  form :partial => 'form'

end
