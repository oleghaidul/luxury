# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Boutique.create!([
                  {:name => 'Renommee', :url_bout => "renommee", :admin_user_id => 2},
                  {:name => 'Gibraud', :url_bout => 'gibraud', :admin_user_id => 3},
                  {:name => 'Pal Zileri', :url_bout => 'pal_zileri', :admin_user_id => 4}
                 ])
3.times do |i|
  Collection.create!([
                    {:name => "First collection", :year => 2012, :season => "winter", :admin_user_id => i+2},
                    {:name => "Second Collection", :year => 2012, :season => "spring", :admin_user_id => i+2},
                    {:name => "Thirdd collection", :year => 2011, :season => "winter", :admin_user_id => i+2}
  ])

  Brand.create!([
                {:name => "Brand1", :name_eng => "brand1", :admin_user_id => i+2},
                {:name => "Brand2", :name_eng => "brand2", :admin_user_id => i+2}
  ])

  Category.create!([
                {:name => "1Category", :name_eng => "1category", :admin_user_id => i+2},
                {:name => "2Category", :name_eng => "2category", :admin_user_id => i+2}
  ])
end
AdminUser.create!([
              {:email => "admin@admin.ru", :role => "admin", :password => "password", :password_confirmation => "password"},            
              {:email => "renommee@admin.ru", :role => "editor", :password => "password", :password_confirmation => "password"},

              {:email => "gibraud@admin.ru", :role => "editor", :password => "password", :password_confirmation => "password"},

              {:email => "pal_zileri@admin.ru", :role => "editor", :password => "password", :password_confirmation => "password"}
])
