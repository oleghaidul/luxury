ActiveAdmin.register Item do

  scope :all, :default => true do |items|
    if can? :manage, @item
      items
    else
      items.where(:admin_user_id => current_admin_user.id)
    end
  end

	index do
    column :name, :sortable => :name do |item|
      auto_link(item)
    end
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

	
  show :title => :name do

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
		f.input :admin_user_id, :as => :hidden, :value => f.template.current_admin_user.id if f.template.cannot? :manage, AdminUser
		f.input :name, :label => "Item name"
		# f.input :collection, :collection => Collection.all.collect {|p| [ p.year.to_s+" "+p.season.to_s, p.id ] }, :include_blank => false
    # f.input :brand
		f.input :structure
		f.input :description, :as => :text
		f.input :price
		f.input :discount
    f.input :boutique, :as => :hidden, :value => f.template.current_admin_user.boutique.id if f.template.cannot? :manage, AdminUser
		f.input :gender, :as => :radio, :collection => [["Male", "male"], ["Female", "female"]]
		# f.input :pictures, :as => :check_boxes, :label_method => Proc.new { |image| "#{image.name}"}
	end

  f.inputs do
    f.has_many :pictures do |p|
      p.input :admin_user_id, :as => :hidden, :value => f.template.current_admin_user.id if f.template.cannot? :manage, AdminUser
    	p.input :name
      p.input :image, :as => :file, :label => "Image", :hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.link_to(p.template.image_tag(p.object.image.url(:small)), [:admin, p.object])
      
    end
   end

  

  f.buttons
end
end
