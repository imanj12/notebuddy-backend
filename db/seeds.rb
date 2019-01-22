# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'iman', password: 'iman', password_confirmation: 'iman')

Note.create(title: 'Saturday Party', content: '<p>Party stuff</p>', user_id: 1, location: '')
Note.create(title: 'To-do List', content: '<p>Stuff to do</p>', user_id: 1, location: '')
Note.create(title: 'Grocery List', content: '<p>shopping list here</p>', user_id: 1, location: '')
Note.create(title: 'Family Birthdays', content: '<p>all birthdays here</p>', user_id: 1, location: '')

Tag.create(name: 'social', user_id: 1)
Tag.create(name: 'work', user_id: 1)
Tag.create(name: 'groceries', user_id: 1)
Tag.create(name: 'family', user_id: 1)

NoteTag.create(tag_id: 1, note_id: 1)
NoteTag.create(tag_id: 2, note_id: 2)
NoteTag.create(tag_id: 4, note_id: 3)
NoteTag.create(tag_id: 4, note_id: 4)




