-- task(1) - Вывести названия треков без тега test
db.tracks.find(
    { tags: { $ne: 'test' } },
    { title: 1, _id: 0 }
)

-- task(2) - Вывести ко-во треков с продолжительностью до одного часа с тегом new
db.tracks.countDocuments(
    { duration_secs: { $lte: 60 * 60 }, tags: 'new' }
)

-- task(3) - Увеличить баланс заблокированных юзеров не из Germany на 5%
db.users.updateMany(
    { is_blocked: true , country: { $ne: 'Germany' } },
    { $mul: { balance: 1.05 } }
)

-- task(4) - Добавить всем трекам теги fresh и popular
db.tracks.updateMany(
    {},
    { $push: { tags: { $each: ['fresh', 'popular'] } } }
)

-- task(5) - С помощью инструмента онлайн-проектирования описать схему БД чат онлайн-поддержки

https://dbdiagram.io/d/65325ae0ffbf5169f019ca66