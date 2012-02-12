ActiveAdmin.register Category do
  
  member_action :delete_id, :method => :post do
    it = Item.find(params[:it_id])
    item = CategoryItem.where(:category_id => params[:id], :item_id => params[:it_id]).first
    item.destroy
    it.boutique_id = nil
    it.collection_id = nil                                
    it.brand_id = nil
    it.category_id = nil
    it.save
    redirect_to :back, :notice => "Item was deleted from this category"
  end

  member_action :add_id, :method => :post do
    it = Item.find(params[:it_id])
    brand_category = BrandCategory.where(:boutique_id => params[:boutique_id],
                                          :collection_id => params[:collection_id],
                                          :brand_id => params[:brand_id],
                                          :category_id => params[:id]).first
    category_item = CategoryItem.new(:category_id => params[:id], 
                                      :item_id => params[:it_id],
                                      :boutique_id => params[:boutique_id],
                                      :collection_id => params[:collection_id],
                                      :brand_id => params[:brand_id],
                                      :brand_category_id => brand_category.id)
    it.boutique_id = params[:boutique_id]
    it.collection_id = params[:collection_id]                                  
    it.brand_id = params[:brand_id]
    it.category_id = params[:id]

    if category_item.save && it.save
      redirect_to :back, :notice => "Item was added from this category"
    else  
      redirect_to :back, :notice => "validations failed"
    end
  end

  after_filter :only => :create do
    @admin = current_admin_user.id
  end

  # scope :mine, :default => true do |categories|
  #   if can? :manage, @category
  #     categories
  #   else
  #     categories.where(:admin_user_id => current_admin_user.id)
  #   end
  # end

  index do
    column :name, :sortable => true do |m|
      auto_link(m)
    end
    column :name_eng
    default_actions
  end

  controller do
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@category = Category.find(params[:id])
		end

	end


  show :title => Proc.new{ if params[:boutique_id] && params[:collection_id] && params[:brand_id]; 
                            "#{Boutique.find(params[:boutique_id]).name} - "+
                            "#{Collection.find(params[:collection_id]).year} - "+
                            "#{Collection.find(params[:collection_id]).season} - "+
                            "#{Brand.find(params[:brand_id]).name} - "+
                            "#{Category.find(params[:id]).name}"; 
                          else; 
                            "#{Category.find(params[:id]).name}"; 
                          end } do
    panel "Category Details" do
      attributes_table_for category do
        row :name
      end
    end

    if params[:boutique_id] && params[:collection_id] && params[:brand_id]
      panel "Items" do
        table_for(category.items.current_boutique(params[:boutique_id], params[:collection_id], params[:brand_id])) do |t|
          t.column(:name) { |item| link_to item.name, admin_item_path(item,
                                                      :boutique_id => params[:boutique_id],
                                                      :collection_id => params[:collection_id],
                                                      :brand_id => params[:brand_id],
                                                      :category_id => params[:id]) }
          t.column("image") do |item| 
            if item.pictures.any?
              link_to image_tag(item.pictures.first.image.url(:small)), admin_picture_path(item.pictures.first)
            end
          end
            t.column() { |item| link_to "Delete", delete_id_admin_category_path(category, :it_id => item), :method => :post, 
                              :confirm => "Are you sure?" }
        end
      end

      panel "Add items to this category" do
        table_for(Item.where(:category_id => nil).mine(current_admin_user.id)) do |t|
          t.column(:name) { |item| link_to item.name, admin_item_path(item) }
          t.column("image") do |item| 
            if item.pictures.any?
              link_to image_tag(item.pictures.first.image.url(:small)), 
                                admin_picture_path(item.pictures.first)
            end
          end
          t.column() { |item| link_to "Add", add_id_admin_category_path(category, 
                                            :it_id => item,
                                            :boutique_id => params[:boutique_id],
                                            :collection_id => params[:collection_id],
                                            :brand_id => params[:brand_id],
                                            :category_id => params[:id]), 
                                            :method => :post, 
                      :confirm => "Are you sure add this item to this category?" }
        end
      end
    end

  end
  

  form :partial => 'form'

end
