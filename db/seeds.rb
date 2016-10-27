
#---------------------  GENDERS -----------------------------

  Gender.create(name: 'мужской')
  Gender.create(name: 'женский')

#-------------------- CITIES --------------------------------

  ['г. Бишкек', 'г. Талас', 'г. Нарын', 'г. Чуй', 'г. Ыссык-Кол', 'г. Баткен',
   'г. Жалал-Абад', 'г. Кант', 'г. Ош'].each do |city|
    City.find_or_create_by({name: city})
  end

#--------------------  ROLES ----------------------------------

['user', 'agent', 'moderator', 'admin', 'banned'].each do |role|
  Role.find_or_create_by({name: role})
end



#---------------------  USERS ---------------------------------

n = 0
['user', 'agent', 'moderator', 'admin'].each do |name|
    n += 1
    email = name + '@example.com'
    password = '123456'

    if Rails.env.development?
      print "\x1b[0;32m"
      puts "PRODUCTION MODE : CREATE USER -> #{name}"
      print "\x1b[0m"
      u = User.new(name: name, email: email, role_id: n, password: password, password_confirmation: password )
      u.skip_confirmation!
      u.save!
    end

    # if Rails.env.development? || Rails.env.test?
    #   print "\x1b[0;32m"
    #   puts "DEV/TEST MODE : CREATE USER -> #{name}"
    #   print "\x1b[0m"
    #   User.create(name: name, email: email, role_id: n, password: password, password_confirmation: password )
    # end

  end


#------------------------- Ucomments------------------------------------------------------



#--------------------- Categories--------------------------------------------------------------------------------------
category = ['Авто и транспорт','Бытовые услуги', 'Детский мир ', 'Для дома и ремонта', 'Досуг и развлечения',
            'Государство и общество', 'Животные', 'Мебель', 'Красота', 'Магазины', 'Медицина и здоровье',
            'Недвижимость', 'Образование', 'Одежда и обувь', 'Организация праздников', 'Производство и промышленность',
            'Профессиональные услуги', 'Реклама, СМИ, полиграфия', 'Спецоборудование', 'Спорт и активный отдых',
            'Туризм и путешествия']
category.each do |n|
  Category.create(title: n)
end
['Автозапчасти и аксессуары', 'Автосалоны', 'Автосервисы', 'Автомойки', 'Автотюнинг', 'Автошколы',
 'Автоэлектроника и GPS', 'Прокат автомобилей', 'Грузовые автомобили и спецтехника', 'Мотосалоны и моторемонт',
 'Эвакуаторы', 'Шины и шиномонтаж', 'Разное - авто и транспорт'].each do |sub|
  Category.create(title: sub, topcategory_id: 1)
end

['Ателье и реставрация одежды', 'Багет', 'Клининговые услуги', 'Грузчики и грузоперевозки', 'Уничтожение грызунов и дезинфекция',
 'Доставка еды и продуктов', 'Ремонт техники и оборудования', 'Химчистки и прачечные', 'Ремонт часов', 'Замки: вскрытие и установка',
 'Справочные службы', 'Такси и пассажирские перевозки', 'Домработницы и сиделки', 'Интернет - провайдеры, ТВ и телефония',
 'Ломбарды', 'Ритуальные услуги', 'Прокат', 'Специализированные мастерские', 'Ремонт мебели', 'Доставка питьевой воды',
 'Брачные агентства', 'Разное - бытовые услуги', 'Интернет провайдеры', 'Мобильные связи', 'ТВ'].each do |sub|
  Category.create(title: sub, topcategory_id: 2)
end
['Детские товары', 'Детская одежда', 'Детские сады и дошкольные учреждения', 'Детские курсы, кружки и клубы'].each do |sub|
  Category.create(title: sub, topcategory_id: 3)
end
['Металлоконструкции', 'Окна, двери, витражи', 'Строительные материалы', 'Кафель и сантехника', 'Осветительная техника',
 'Шторы, жалюзи и ролл-ставни', 'Натяжные потолки', 'Кондиционирование и вентиляция', 'Кровля и сайдинг', 'Лестницы',
 'Трубы и фитинги', 'Полы', 'Ковка', 'Системы видеонаблюдения и безопасности', 'Хозтовары', 'Электрика', 'Лес и пиломатериалы',
 'Ремонт и отделка', 'Заборы и ограждения', 'Бассейны и сауны', 'Лакокрасочная продукция', 'Брусчатка', 'Разное - для дома и ремонта'].each do |sub|
  Category.create(title: sub, topcategory_id: 4)
end
['Кафе, бары, рестораны', 'Кофе и кофейни', 'Банные комплексы и сауны', 'Бильярдные', 'Боулинг центры', 'Букмекеры', 'Пейнтбол клубы',
 'Кинотеатры', 'Театры и филормонии', 'Музеи и галереи', 'Ночные клубы', 'Развлекательные центры', 'Аттракционы и парки отдыха',
 'Дома культуры', 'Отдых для детей', 'Ледовые катки', 'Разное - досуг и развлечения'].each do |sub|
  Category.create(title: sub, topcategory_id: 5)
end
['Архивы', 'Библиотеки', 'Военкоматы', 'Отделы ГАИ', 'Детские дома', 'ЗАГСы', 'Инспекции и надзорные органы', 'Коммунальные службы',
 'Налоговые службы', 'Общественные организации', 'Органы власти', 'Отделения милиции', 'Паспортные службы', 'Пенсионные фонды и Собес',
 'Посольства', 'Почта', 'Религиозные организации', 'Прокуратура', 'Суды', 'Экстренные службы', 'Некоммерческие организации',
 'Таможенные службы', 'Национальные и культурные центры', 'Благотворительные фонды', 'Разное - Государство и общество'].each do |sub|
  Category.create(title: sub, topcategory_id: 6)
end
['Ветеринарные клиники', 'Зоомагазины', 'Услуги для животных', 'Разведение и продажа животных', 'Разное - животные'].each do |sub|
  Category.create(title: sub, topcategory_id: 7)
end
['Корпусная мебель', 'Мягкая мебель', 'Мебель для ванных комнат', 'Мебельная фурнитура', 'Офисная мебель', 'Шкафы - купе',
 'Разное - мебель', 'Торговое и выставочное оборудование'].each do |sub|
  Category.create(title: sub, topcategory_id: 8)
end
['Ногтевые студии', 'Салоны красоты', 'SPA - центры', 'Солярии', 'Стилисты и визажисты', 'Наращивание ресниц и волос', 'Тату и пирсинг',
 'Разное - Красота'].each do |sub|
  Category.create(title: sub, topcategory_id: 9)
end
['Алкогольные напитки', 'Бытовая техника и электроника', 'Интим - магазины', 'Интернет-магазины', 'Инструмент', 'Искусство и антиквариат',
 'Канцелярские товары', 'Книжные магазины', 'Ковры и ковровые изделия', 'Косметика и парфюм', 'Компьютеры и оргтехника', 'Кондитерские изделия и кулинария',
 'Мобильные телефоны', 'Музыкальные инструменты', 'Оптовая торговля', 'Очки и оптика', 'Подарки и сувениры', 'Постельные принадлежности', 'Посуда', 'Продукты питания',
 'Секонд - хенд и комиссионки', 'Спортивные товары и снаряжение', 'Сумки и чемоданы', 'Ткани и текстиль', 'Торговые центры',
 'Хобби - магазины', 'Цветочные магазины', 'Часы Ювелирные и бижутерия', 'Разное - магазины'].each do |sub|
  Category.create(title: sub, topcategory_id: 10)
end
['Аптеки', 'Больницы', 'Диспансеры', 'Лаборатории', 'Диагностика', 'Мануальная терапия', 'Массаж', 'Медицинские центры',
 'Офтальмологи', 'Лечение зависимости', 'Педиатрия', 'Пластическая хирургия', 'Поликлиники', 'Психологическая помощь', 'Родильные дома',
 'Скорая помощь', 'Стоматологические услуги', 'Реабилитационные центры', 'Разное - медицина и здоровье'].each do |sub|
  Category.create(title: sub, topcategory_id: 11)
end
['Агентства недвижимости', 'Легкие конструкции', 'Оценка недвижимости', 'Строительные компании', 'Недвижимость на Иссык-Куле', 'Бизнес-центры', 'Архитектурное проектирование',
 'Недвижимость за рубежом', 'Согласование перепланировок', 'Разное - Недвижимость'].each do |sub|
  Category.create(title: sub, topcategory_id: 12)
end
['Автошколы', 'ВУЗы', 'Дополнительное образование и курсы', 'Колледжи и техникумы', 'Компьютерные курсы', 'Языковые курсы', 'Тренинги и семинары',
 'Школы', 'Специальные школы', 'Музыкальные школы', 'Разное - образование'].each do |sub|
  Category.create(title: sub, topcategory_id: 13)
end
['Мужская одежда', 'Женская одежда', 'Головные уборы', 'Верхняя одежда и меха', 'Для будущих мам', 'Спецодежда',
 'Спортивная одежда', 'Обувь', 'Нижнее белье', 'Свадебные салоны', 'Разное - одежда и обувь'].each do |sub|
  Category.create(title: sub, topcategory_id: 14)
end
['Банкетные залы', 'Цветы и оформление', 'Кейтеринг', 'Организация торжеств и свадеб', 'Танцевальные и музыкальные коллективы',
 'Пиротехника', 'Прокат автомобилей', 'Разное - организация праздников'].each do |sub|
  Category.create(title: sub, topcategory_id: 15)
end
['Добыча и обработка', 'Электроэнергетика и электротехника', 'Легкая промышленность', 'Продукты питания', 'Сельхозпродукция',
'Вино-водочная и напитки', 'Химическая промышленность', 'Табачная промышленность', 'Геология и разведка', 'Деревообработка',
 'Металлообработка', 'Нефтепродукты', 'Машиностроение', 'Растениеводческие хозяйства', 'Удобрения и средства защиты', 'Мясо, птица, рыба',
 'Стройматериалы Разное - Производство и промышленность'].each do |sub|
  Category.create(title: sub, topcategory_id: 16)
end
['Деловые и бизнес - услуги', 'Web-дизайн', 'Разработка ПО и мобильных приложений', 'Грузоперевозки', 'Охранные и детективные агентства',
 'Дизайн интерьеров и ландшафта', 'Звукозапись', 'Киностудии', 'Печати и штампы', 'Кадровые агентства', 'Маркетинговые услуги',
 'Банковские и финансовые услуги', 'Брокерские услуги', 'Модельные агентства', 'Консалтинговые услуги', 'Языковые переводы', 'Бухгалтерские услуги',
 'Страховые компании', 'Экспертиза и оценка', 'Юридические услуги', 'Нотариусы', 'Продюсерские центры', 'Промышленный альпинизм', 'Фотостудии и видео', 'Почтовые службы',
 'Разное - деловые и бизнес - услуги'].each do |sub|
  Category.create(title: sub, topcategory_id: 17)
end
['Зарубежные СМИ', 'Информагентства', 'Печатные СМИ', 'Радиостанции', 'Телевидение', 'Наружная реклама',
 'Полиграфия и типографии', 'Шелкография', 'Рекламные агентства', 'Упаковка', 'Выставки', 'Разное - реклама, СМИ, полиграфия'].each do |sub|
  Category.create(title: sub, topcategory_id: 18)
end
['Торговое и выставочное оборудование', 'Холодильное и морозильное', 'Строительное', 'Пищевое', 'Нестандартное', 'Отопительное', 'Вентиляционные системы',
 'Для бассейнов и саун', 'Контрольно-кассовое', 'Швейное', 'Телекоммуникационное и сетевое', 'Грузоподъемное', 'Водоочистка и очистные сооружения', 'Промышленное',
 'Компрессоры и насосы', 'Газовое', 'Противопожарное', 'Сельскохозяйственное', 'Медицинское', 'Электротехническое', 'Разное - Спецоборудование'].each do |sub|
  Category.create(title: sub, topcategory_id: 19)
end
['Бассейны и аквапарки', 'Гольф', 'Йога', 'Картинг', 'Горнолыжные базы', 'Пеший туризм', 'Рафтинг', 'Танцевальные студии', 'Фитнес - клубы', 'Охота и рыбалка',
 'Спортивные комплексы', 'Спортшколы и клубы', 'Стрелковые полигоны и тиры', 'Теннисные корты', 'Спортивные федерации', 'Стадионы и футбольные поля',
 'Прокат спортивного снаряжения', 'Разное - спорт и активный отдых'].each do |sub|
  Category.create(title: sub, topcategory_id: 20)
end
['Гостиницы', 'Аэропорты и вокзалы', 'Туристические агентства', 'Авиакассы ж/д кассы', 'Прокат автомобилей', 'Охота и рыбалка', 'Горнолыжные базы Разное - туризм и путешествия',
 'Курорты и санатории'].each do |sub|
  Category.create(title: sub, topcategory_id: 21)
end

#--------------------  COMPANY ------------------------------

Company.create(title:             'Beeline',
               description:       '#1 company in mobile service',
               address:           'ул. Киевская 65',
               phones:            '0(312)979888;0(312)665566',
               email:             'info@beeline.kg',
               website:           'beeline.kg',
               working_hours:     'Пн-Пт (9:00-17:00)',
               registration_year: '2006',
               city_id:            1,
               category_id:        55)

Company.create(title:             'Megacom',
               description:       'We are the leader in mobile service',
               address:           'ул. Дзержинского 65',
               phones:            '0(312)656565;0(312)555444',
               email:             'info@megacom.kg',
               website:           'megacom.kg',
               working_hours:     'Пн-Пт (10:00-18:00)',
               registration_year: '2002',
               city_id:            1,
               category_id:        55)


#-------------------------Comments--------------------------------

Ucomment.create(title: 'Падение скорости',
                body: 'Нет скорости по внешнеи зоне. Даже при прямом подключении выдает при замере очень маленкую скорость,
я без связи не могут контролировать химиков и варку... Мешаете варить мет, чего я вам не советую.',
                positive: false,
                rate: 2,
                company_id: 1,
                user_id: 1)

Ucomment.create(title: '2Падение скорости',
                body: 'Нет скорости по внешнеи зоне. Даже при прямом подключении выдает при замере очень маленкую скорость,
я без связи не могут контролировать химиков и варку... Мешаете варить мет, чего я вам не советую.',
                positive: false,
                rate: 1,
                company_id: 2,
                user_id: 1)

Ucomment.create(title: '3Падение скорости',
                body: 'Нет скорости по внешнеи зоне. Даже при прямом подключении выдает при замере очень маленкую скорость,
я без связи не могут контролировать химиков и варку... Мешаете варить мет, чего я вам не советую.',
                positive: true,
                rate: 3,
                company_id: 1,
                user_id: 1)