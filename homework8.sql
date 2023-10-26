-- task(1) - Вывести среднюю реакцию по треку 1
db.reactions.aggregate([
    { $match: { track_id: 1 } },
    { 
        $group: {
             _id: '$track_id',
             avg_grade: { $avg: '$value' }  
        } 
    },
    { $project: { avg_grade: 1, _id: 0 } }
])

-- task(2) - Увеличить баланс всех незаблокированных юзеров на 0.5%
db.users.updateMany(
    { is_blocked: { $ne: true } },
    { 
        $mul: { balance: 1.005 }
    }
)

-- task(3) - Вывести ко-во реакций с оценкой 4
db.reactions.aggregate([
    { $match: { value: 4 } },
    { $count: 'count' },
])

-- task(4) - Вывести названия треков, принадлежащих юзеру 4
db.users.aggregate([
    { $match: { _id: 4 } },
    { $lookup: {
        from: "tracks",
        localField: "_id",
        foreignField: "author_id",
        as: "tracks"
    } },
    { $project: { _id: 0, tracks_name: "$tracks.title"} }
])

-- task(5) - С помощью инструмента онлайн-проектирования опишите схему БД поликлиника

https://dbdiagram.io/d/6538eea3ffbf5169f06b754e