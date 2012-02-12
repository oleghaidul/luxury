# coding: utf-8

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
                {:name => 'Ermenegildo Zegna', :name_eng => "Ermenegildo_Zegna"},
                {:name => 'Pal Zileri', :name_eng => 'Pal_Zileri'},
                {:name => 'Canali', :name_eng => 'Canali'},
                {:name => 'Corneliani', :name_eng => 'Corneliani'},
                {:name => 'Emanuel Ungaro', :name_eng => 'Emanuel_Ungaro'},
                {:name => 'Galliano', :name_eng => 'Galliano'},
                {:name => 'Francesco SMALTO', :name_eng => 'Francesco_SMALTO'},
                {:name => 'Christian Lacroix', :name_eng => 'Christian_Lacroix'},
                {:name => 'Pierre BALMAIN', :name_eng => 'Pierre_BALMAIN'},
                {:name => 'Jean Paul Gaultier', :name_eng => 'Jean_Paul_Gaultier'},
                {:name => 'Nina Ricci,', :name_eng => 'Nina_Ricci,'},
                {:name => 'Azzaro', :name_eng => 'Azzaro'},
                {:name => 'Andrew GN', :name_eng => 'Andrew_GN'},
                {:name => 'IRFE', :name_eng => 'IRFE'},
                {:name => 'Leonard', :name_eng => 'Leonard'},
                {:name => 'Matthew Williamson', :name_eng => 'Matthew_Williamson'},
                {:name => 'Tartine et Chocolat', :name_eng => 'Tartine_et_Chocolat'},
                {:name => 'Hugo Boss', :name_eng => 'Hugo_Boss'},
                {:name => 'Max Mara', :name_eng => 'MaxMara'},
                {:name => 'Gianfranco Ferre', :name_eng => 'Gianfranco_Ferre'},
                {:name => 'Ice IceBerg', :name_eng => 'Ice_IceBerg'}
              ])

Category.create!([
              {:name => "Рубашки", :name_eng => "Dress_shirts"},
              {:name => "Костюмы", :name_eng => "Suits"},
              {:name => "Брюки", :name_eng => "Pants"},
              {:name => "Свитера", :name_eng => "Sweaters"},
              {:name => "Джинсы", :name_eng => "Jeans"},
              {:name => "Футболки", :name_eng => "T-Shirts"},
              {:name => "Поло", :name_eng => "Polo"}
])
