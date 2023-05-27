# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@ice_palace = IcePalace.create(title: 'Мегаспорт', adress: 'Ходынский бульвар, 3',
                 description: 'Дворец спорта «Мегаспорт» имени А.В. Тарасова – это не только спортивное сооружение, но и универсальная площадка для проведения культурных мероприятий, увлекательных шоу, музыкальных выступлений и презентаций. Удобное расположение, современная архитектура, уникальная спортивная арена, высокий уровень инфраструктуры для посетителей – все это делает комплекс одной из лучших и перспективных спортивных и зрелищных площадок в Москве.', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Af47d6fc3aa540f389056f4154b5fbd675e035bc80ad7543ed16fb74ad61d1f01&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace1.jpg'), filename: 'ice_palace1.jpg')
binding.irb

@ice_palace = IcePalace.create(title: 'ЦСКА Арена', adress: 'Автозаводская улица, 23А',
                 description: 'Комплекс «ЦСКА АРЕНА» был открыт в 2015 году. Все арены комплекса являются трансформерами и принимают не только хоккейные матчи, но и соревнования по другим видам спорта, а также фестивали, выставки, концерты и шоу-программы российского и международного уровня. Эти особенности делают арену уникальным и многофункциональным спортивно-развлекательным сооружением.', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A3ce245e529981db86c7b31979f50b7446de8404d5113945c0146d67f2652ed19&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace2.jpg'), filename: 'ice_palace2.jpg')

@ice_palace = IcePalace.create(title: 'ВТБ Арена', adress: 'Ленинградский проспект, 36',
                 description: 'Многофункциональный спортивный комплекс в Москве, включающий в себя футбольную и хоккейную арену, построенный на месте снесённого стадиона «Динамо». Стадион под одной крышей объединяет две арены: Центральный стадион «Динамо» имени Льва Яшина и универсальную «ВТБ Арену» им. А. И. Чернышёва.', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Ad428aca195d3a287bc1128928dcd4427a7dacb6cd660705285518c46034675cc&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace3.png'), filename: 'ice_palace3.png')

@ice_palace = IcePalace.create(title: 'Олимпийский', adress: 'Олимпийский проспект, 16с1',
                 description: '«Олимпийский» – легендарное спортивное сооружение, история которого насчитывает более четырех десятилетий. Спорткомплекс был построен к Олимпийским играм 1980 года, став одной из главных достопримечательностей Москвы, и долгое время был самым крупным крытым спортивным сооружением в Европе', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A8e77d5e3b56e2b9f0b9143ebea09ded1e6afac51946bde44090f8d3adffe23f4&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace4.jpg'), filename: 'ice_palace4.jpg')

@ice_palace = IcePalace.create(title: 'Крылатское', adress: 'Крылатская улица, 16',
                 description: 'Современный спортивный комплекс для организации соревнований по конькобежному спорту и организации тренировок спортсменов, расположенный в городе Москве, в районе Крылатское.', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aa5c7be54e767899e6014bec72c8d1af05b68a8234c34714982991944f45d02a5&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace5.jpg'), filename: 'ice_palace5.jpg')

@ice_palace = IcePalace.create(title: 'Лужники', adress: 'улица Лужники, 24с1',
                 description: 'Второе после стадиона сооружение Олимпийского комплекса «Лужники», расположенное в его северо-западной части, крытая универсальная многофункциональная площадка со зрительным залом. ', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A7ad55ce9dbeaccb379f1cd32b691342f09503df7fe2d7dea433f07157646cb9d&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace6.png'), filename: 'ice_palace6.png')

@ice_palace = IcePalace.create(title: 'Сокольники', adress: 'улица Сокольнический Вал, 1Бс2',
                 description: 'Дворец спорта «Сокольники» был открыт 14 апреля 1956 года на территории одноимённого парка культуры и отдыха. Изначально на месте нынешнего ДС находилась лишь хоккейная коробка, окружённая трибунами, под которыми находились помещения для спортсменов. По причине проведения в Москве соревнований по волейболу Универсиады-1973 арену было решено реконструировать, в результате чего над ней появилась крыша.', map_script: 'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aa0ffc419da4ef6018575b77a8136880e3f3dae70d6e4ede77afc043b465918ce&amp;width=320&amp;height=240&amp;lang=ru_RU&amp;scroll=true')
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace7.jpg'), filename: 'ice_palace7.jpg')