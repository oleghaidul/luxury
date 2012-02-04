ActiveAdmin.register Boutique do

  scope :mine, :default => true do |boutiques|
    boutiques.where(:admin_user_id => current_admin_user.id)
  end

	controller do
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@boutique = Boutique.find_by_url_bout(params[:id])
		end
	end

	controller.authorize_resource

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

    panel "Collections" do
      table_for(boutique.collections) do |t|
        t.column(:name) { |col| link_to col.name, admin_collection_path(col) }
        t.column(:year)
        t.column(:season)
        t.column() { |col| link_to "Delete", admin_collection_path(col), :method => :delete, :confirm => "Are you sure?" }
      end
    end
  end


  form :partial => 'form'


end
