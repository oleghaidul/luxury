ActiveAdmin.register AdminUser do
  index do
    column :email
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, :as => :select, :collection => ["admin", "editor"]
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

end
