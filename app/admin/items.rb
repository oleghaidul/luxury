ActiveAdmin.register Item do

  member_action :delete_id, :method => :post do
    item = Item.find(params[:id])
    item.collection_id = nil
    item.save!
    redirect_to :back, :notice => "#{item.name} was deleted from this boutique"
  end

  scope :mine, :default => true do |items|
    items.where(:admin_user_id => current_admin_user.id)
  end

	index do
    column :name, :sortable => :name do |item|
      auto_link(item)
    end
    column :category
    column :brand
    column :collection
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
	
  show :title => :to_label do

    panel "Item Details" do
      attributes_table_for item do
        row("Name") { link_to item.name, admin_item_path(item) }
      end
    end

    panel "Pictures" do
      table_for item.pictures do |p|
        p.column("Name") { |picture| picture.name }
        p.column("Image") { |picture| link_to image_tag(picture.image.url(:small)), admin_picture_path(picture)}
      end
    end

    
  end

  form :html => { :enctype => "multipart/form-data" } do |f|


	f.inputs do
    f.buttons
		f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|p| [ p.email, p.id ] }, :include_blank => "Select your account", :label => "Owner"
		f.input :name, :label => "Item name"
		# f.input :collection, :collection => Collection.all.collect {|p| [ p.year.to_s+" "+p.season.to_s, p.id ] }, :include_blank => false
    # f.input :brand
    f.input :category
    f.input :collection
    f.input :brand
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
      p.input :image, :as => :file, :label => "Image", :hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:small))
    end
   end

  

  f.buttons
end
end
