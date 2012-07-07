# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doug = User.create(first_name: 'Doug', last_name: 'Safreno', email: 'joke@joke.com')
daniel = User.create(first_name: 'Daniel', last_name: 'Liem', email: 'joke@joke.com')
sample = Ladder.create(:name => 'Sample ladder',
                       :entries => [Entry.create(:user => doug, :elo => 1000.0), Entry.create(:user => daniel, :elo => 1000.0)],
                       :admin => Admin.create(user: doug))
eDoug = sample.entries[0]
eDaniel = sample.entries[1]

eDoug.update_attributes(:ladder => sample)

#eDoug.ladder = sample
eDaniel.ladder = sample
#eDoug.save
eDaniel.save

win = Win.create(:entry => eDaniel)
loss = Loss.create(:entry => eDoug)
record = Record.create(:wins => [win], :losses => [loss])
win.record = record
loss.record = record
win.save
loss.save
