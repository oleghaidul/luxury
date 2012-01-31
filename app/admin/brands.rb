ActiveAdmin.register Brand do

  

  controller do
    before_filter :admin, :except => [:index, :new, :create]
    def admin
      @brand = Brand.find(params[:id])
    end
  end

  controller.authorize_resource

  index do
    column :name
    column :name_eng
    column :boutique
    default_actions
  end

  show do
    h3 brand.name
  end
  

  form :partial => 'form'
end
