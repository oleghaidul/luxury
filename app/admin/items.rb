ActiveAdmin.register Item do

	index do
    column :name
    column :collection
    column :category
    column :structure
    column :price
    column :discount
    column :gender
    default_actions
  end

	controller do
		uses_tiny_mce :options => {
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => false,
                            :plugins => %w{ table fullscreen }
                          }
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@item = Item.find(params[:id])
		end

		def new
			super do
				@item.pictures.build
			end
		end
	end

	controller.authorize_resource
	
	show do
    h3 item.name
    div item.description
    div do
    	item.pictures.each do |ff|
    		image_tag ff.image.url
    	end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|


	f.inputs do
		f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|p| [ p.email, p.id ] }, :include_blank => "Select your account", :label => "Owner"
		f.input :name, :label => "Item name"
		f.input :collection, :collection => Collection.all.collect {|p| [ p.year.to_s+" "+p.season.to_s, p.id ] }, :include_blank => false
	    f.input :category
		f.input :structure
		f.input :description, :as => :text
		f.input :price
		f.input :discount
		f.input :gender, :as => :radio, :collection => [["Male", "male"], ["Female", "female"]]
		# f.input :pictures, :as => :check_boxes, :label_method => Proc.new { |image| "#{image.name}"}
	end

  f.inputs do
    f.has_many :pictures do |p|
    	p.inputs :name
      p.inputs :image, :label_method => :name, :as => :file
    end
   end

  

  f.buttons
end
end
