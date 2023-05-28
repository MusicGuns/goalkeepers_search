# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@ice_palace = IcePalace.insert!({title: 'Мегаспорт', adress: 'Ходынский бульвар, 3',
                 description: 'Дворец спорта «Мегаспорт» имени А.В. Тарасова – это не только спортивное сооружение, но и универсальная площадка для проведения культурных мероприятий, увлекательных шоу, музыкальных выступлений и презентаций. Удобное расположение, современная архитектура, уникальная спортивная арена, высокий уровень инфраструктуры для посетителей – все это делает комплекс одной из лучших и перспективных спортивных и зрелищных площадок в Москве.', cords: '55.786698-37.539895'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace1.jpg'), filename: 'ice_palace1.jpg')

@ice_palace = IcePalace.insert!({title: 'ЦСКА Арена', adress: 'Автозаводская улица, 23А',
                 description: 'Комплекс «ЦСКА АРЕНА» был открыт в 2015 году. Все арены комплекса являются трансформерами и принимают не только хоккейные матчи, но и соревнования по другим видам спорта, а также фестивали, выставки, концерты и шоу-программы российского и международного уровня. Эти особенности делают арену уникальным и многофункциональным спортивно-развлекательным сооружением.', cords: '55.701618-37.644773'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace2.jpg'), filename: 'ice_palace2.jpg')

@ice_palace = IcePalace.insert!({title: 'ВТБ Арена', adress: 'Ленинградский проспект, 36',
                 description: 'Многофункциональный спортивный комплекс в Москве, включающий в себя футбольную и хоккейную арену, построенный на месте снесённого стадиона «Динамо». Стадион под одной крышей объединяет две арены: Центральный стадион «Динамо» имени Льва Яшина и универсальную «ВТБ Арену» им. А. И. Чернышёва.', cords: '55.791248-37.559388'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace3.png'), filename: 'ice_palace3.png')

@ice_palace = IcePalace.insert!({title: 'Олимпийский', adress: 'Олимпийский проспект, 16с1',
                 description: '«Олимпийский» – легендарное спортивное сооружение, история которого насчитывает более четырех десятилетий. Спорткомплекс был построен к Олимпийским играм 1980 года, став одной из главных достопримечательностей Москвы, и долгое время был самым крупным крытым спортивным сооружением в Европе', cords: '55.781028-37.626493'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace4.jpg'), filename: 'ice_palace4.jpg')

@ice_palace = IcePalace.insert!({title: 'Крылатское', adress: 'Крылатская улица, 16',
                 description: 'Современный спортивный комплекс для организации соревнований по конькобежному спорту и организации тренировок спортсменов, расположенный в городе Москве, в районе Крылатское.', cords: '55.766567-37.435367'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace5.jpg'), filename: 'ice_palace5.jpg')

@ice_palace = IcePalace.insert!({title: 'Лужники', adress: 'улица Лужники, 24с1',
                 description: 'Второе после стадиона сооружение Олимпийского комплекса «Лужники», расположенное в его северо-западной части, крытая универсальная многофункциональная площадка со зрительным залом. ', cords: '55.715677-37.552166'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace6.png'), filename: 'ice_palace6.png')

@ice_palace = IcePalace.insert!({title: 'Сокольники', adress: 'улица Сокольнический Вал, 1Бс2',
                 description: 'Дворец спорта «Сокольники» был открыт 14 апреля 1956 года на территории одноимённого парка культуры и отдыха. Изначально на месте нынешнего ДС находилась лишь хоккейная коробка, окружённая трибунами, под которыми находились помещения для спортсменов. По причине проведения в Москве соревнований по волейболу Универсиады-1973 арену было решено реконструировать, в результате чего над ней появилась крыша.', cords: '55.793212-37.673232'}, record_timestamps: true)
@ice_palace = IcePalace.last
@ice_palace.photo.attach(io: File.open('app/assets/images/ice_palace7.jpg'), filename: 'ice_palace7.jpg')
