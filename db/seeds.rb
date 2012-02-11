# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

AdminUser.create!([
              {:email => "admin@luxury.by", :role => "admin", :password => "password", :password_confirmation => "password"},
              {:email => "renommee@luxury.by", :role => "editor", :password => "password", :password_confirmation => "password"},
              {:email => "zegna@luxury.by", :role => "editor", :password => "password", :password_confirmation => "password"},
              {:email => "pal_zileri@luxury.by", :role => "editor", :password => "password", :password_confirmation => "password"},
              {:email => "pret_a_porter@luxury.by", :role => "editor", :password => "password", :password_confirmation => "password"}
])

Boutique.create!([
                  {:name => 'Renommee', :url_bout => "renommee", :admin_user_id => 2},
                  {:name => 'Ermenegildo Zegna', :url_bout => 'Zegna', :admin_user_id => 3},
                  {:name => 'Pal Zileri', :url_bout => 'pal_zileri', :admin_user_id => 4}
                 ])

Collection.create!([
                  {:name => "Осень-зима 2011-2012", :year => 2011, :season => "winter"},
                  {:name => "Весна-лето 2012", :year => 2012, :season => "summer"}
])

Brand.create!([
                {:name => 'Ermenegildo Zegna', :name_eng => "Ermenegildo Zegna"},
                {:name => 'Pal Zileri', :name_eng => 'Pal Zileri'},
                {:name => 'Canali', :name_eng => 'Canali'},
                {:name => 'Corneliani', :name_eng => 'Corneliani'},
                {:name => 'Emanuel Ungaro', :name_eng => 'Emanuel Ungaro'},
                {:name => 'Galliano', :name_eng => 'Galliano'},
                {:name => 'Francesco SMALTO', :name_eng => 'Francesco SMALTO'},
                {:name => 'Christian Lacroix', :name_eng => 'Christian Lacroix'},
                {:name => 'Pierre BALMAIN', :name_eng => 'Pierre BALMAIN'},
                {:name => 'Jean Paul Gaultier', :name_eng => 'Jean Paul Gaultier'},
                {:name => 'Nina Ricci,', :name_eng => 'Nina Ricci,'},
                {:name => 'Azzaro', :name_eng => 'Azzaro'},
                {:name => 'Andrew GN', :name_eng => 'Andrew GN'},
                {:name => 'IRFE', :name_eng => 'IRFE'},
                {:name => 'Leonard', :name_eng => 'Leonard'},
                {:name => 'Matthew Williamson', :name_eng => 'Matthew Williamson'},
                {:name => 'Tartine et Chocolat', :name_eng => 'Tartine et Chocolat'},
                {:name => 'Hugo Boss', :name_eng => 'Hugo Boss'},
                {:name => 'Max Mara', :name_eng => 'MaxMara'},
                {:name => 'Gianfranco Ferre', :name_eng => 'Gianfranco Ferre'},
                {:name => 'Ice IceBerg', :name_eng => 'Ice IceBerg'}
              ])

Category.create!([
              {:name => "Рубашки", :name_eng => "Dress shirts"},
              {:name => "Костюмы", :name_eng => "Suits"},
              {:name => "Брюки", :name_eng => "Pants"},
              {:name => "Свитера", :name_eng => "Sweaters"},
              {:name => "Джинсы", :name_eng => "Jeans"},
              {:name => "Футболки", :name_eng => "T-Shirts"},
              {:name => "Поло", :name_eng => "Polo"}
])