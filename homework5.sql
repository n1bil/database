-- task(1) - Вывести имена юзеров не из France
db.users.find(
    { country: { $ne: "France" } }
)

-- task(2) - Добавить несколько реакций на треки
db.tracks.updateOne(
    { _id: 1 },
    { $set: { reaction: 2 } }
)

db.tracks.updateOne(
    { _id: 2 },
    { $set: { reaction: 4 } }
)

db.tracks.updateOne(
    { _id: 3 },
    { $set: { reaction: 1 } }
)

db.tracks.updateOne(
    { _id: 4 },
    { $set: { reaction: 5 } }
)

db.tracks.updateOne(
    { _id: 5 },
    { $set: { reaction: 4 } }
)

-- task(3) - Вывести названия треков продолжительностью от 1 до 10 мин
db.tracks.find(
    { duration_secs: { $gte: 60, $lte: 60 * 10} },
    { title: 1, _id: 0 }
)

-- task(4) - Вывести треки юзера 4
db.tracks.find(
    { author_id: 4 }
)

-- task(5) - С помощью инструмента онлайн-проектирования описать БД music (юзеры, треки, реакции, плейлисты)

https://dbdiagram.io/d/6531543effbf5169f00b7ed4