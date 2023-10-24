-- task(1) - Вывести названия двух произвольных треков с тегом new
db.tracks.aggregate(
    { $match: { tags: 'new' } },
    { $sample: { size: 2 } }
)

-- task(2) - Вывести имя юзера с самым минимальным балансом
db.users.aggregate(
    { $sort: { balance: 1 } },
    { $limit: 1 },
    { $project: { _id: 0, fullname: 1 } }
)

-- task(3) - Вывести имена юзеров, у которых есть треки
db.users.aggregate([
    { $lookup: 
        { from: 'tracks',
          localField: '_id',
          foreignField: 'author_id',
          as: 'tracks' } },
    { $match: { tracks: { $ne: [] } } }
])

-- task(4) - Используя метод aggregate(), вывести ко-во юзеров с балансом до 1000 EUR
db.users.aggregate(
    { $match: { balance: { $lte: 1000 } } },
    { $count: 'count_users' }
)

-- task(5) - Также очень коротко опишите, как работает агрегация в MongoDB

-- Агрегация работает так: 
--  1) Мы получаем данные коллекции.
--  2) Каждая стадия принимает на вход коллекцию.
--  3) Обрабатывает данные в соответствии определенными правилами.
--  4) Затем каждая стадия возращает результат новой коллекции.