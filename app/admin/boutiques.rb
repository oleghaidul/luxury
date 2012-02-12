ActiveAdmin.register Boutique do

  member_action :delete_id, :method => :post do
    boutique_collection = BoutiqueCollection.where(:boutique_id => params[:id], :collection_id => params[:col_id]).first
    boutique_collection.destroy
    redirect_to :back, :notice => "collection was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    boutique_collection = BoutiqueCollection.new(:boutique_id => params[:id], :collection_id => params[:col_id])
    if boutique_collection.save
      redirect_to :back, :notice => "collection was added from this boutique"
    else  
      redirect_to :back, :notice => "validations failed"
    end
  end

  scope :all, :default => true do |boutiques|
    if can? :manage, @boutique
      boutiques
    else
      boutiques.where(:admin_user_id => current_admin_user.id)
    end
  end

	controller do
		before_filter :admin, :except => [:index, :new, :create]

		def admin
			@boutique = Boutique.find_by_url_bout(params[:id])
		end

    def show
      super do
        @boutique_colelction = BoutiqueCollection.last
      end
    end

	end


  index do
    column :name , :sortable => :name do |m|
      auto_link(m)
    end
    column :multibrand, :sortable => :multibrand do |m|
      status_tag (m.multibrand ? "Yes" : "No"), (m.multibrand ? :ok : :error)
    end
    column :ico do |m|
      image_tag m.ico.url, :width => "30"
    end
    column :phone
    column :phone2
    column :director
    column :address
    column :url_bout
    column :email
    column :website
    default_actions
  end

  show :title => :name do
    panel "Boutique Details" do
      attributes_table_for boutique do
        row :name
        row(:ico) { image_tag boutique.ico.url }
        row("Logo") { image_tag boutique.image.url }
        row(:multibrand) { status_tag (boutique.multibrand ? "Yes" : "No"), (boutique.multibrand ? :ok : :error) }
        row :phone
        row :phone2
        row :address
        row :url_bout
        row :email
        row :website
      end
    end

    panel "#{boutique.name}'s collections" do
      table_for(boutique.collections) do |t|
        t.column(:name) { |col| link_to col.name, admin_collection_path(col, :boutique_id => params[:id]) }
        t.column(:year)
        t.column(:season)
        t.column() { |col| link_to "Delete", delete_id_admin_boutique_path(boutique, :col_id => col), :method => :post, :confirm => "Are you sure?" }
      end
    end

    panel "Add collections to this boutique" do
      table_for(Collection.excluding_ids(boutique.collection_ids)) do |t|
        t.column(:name) do |col| 
          link_to col.name, admin_collection_path(col)
        end
        t.column() do |col| 
          link_to "Add", add_id_admin_boutique_path(boutique, :col_id => col), :method => :post, 
                      :confirm => "Are you sure add this collection to this boutique?" 
        end
      end
    end

    
  end


  form :partial => 'form'


end
