u1 = User.create(email: 'george@gmail.com', given_name: 'George', surname: 'Ashworth', password: 'password')
u2 = User.create(email: 'andrew@gmail.com', given_name: 'Andrew', surname: 'Ashworth', password: 'password')
u3 = User.create(email: 'steven@gmail.com', given_name: 'Steven', surname: 'Ashworth', password: 'password')

b1 = u1.boards.create(title: 'ProFlows')
b2 = u1.boards.create(title: 'App Academy')
b3 = u1.boards.create(title: 'Meteor.js')

b4 = u2.boards.create(title: 'Ultimate Frisbee')
b5 = u2.boards.create(title: 'Dissertation')
b6 = u2.boards.create(title: 'BBQ Mastery')

b7 = u3.boards.create(title: 'Road to #TI5')
b8 = u3.boards.create(title: 'The Texas Method')
b9 = u3.boards.create(title: 'Twitch.tv Marketing')

l1 = b1.lists.create(title: 'todo')
l2 = b1.lists.create(title: 'doing')
l3 = b1.lists.create(title: 'done')

l4 = b2.lists.create(title: 'todo')
l5 = b2.lists.create(title: 'doing')
l6 = b2.lists.create(title: 'done')

l7 = b3.lists.create(title: 'todo')
l8 = b3.lists.create(title: 'doing')
l9 = b3.lists.create(title: 'done')

c1 = l1.cards.create(title: 'Conference Calling', description: 'WebRTC')
c2 = l1.cards.create(title: 'Keyboard Shortcuts', description: 'Fancy')
c3 = l1.cards.create(title: 'WebGL', description: 'Fancy Schmancy')

c4 = l2.cards.create(title: 'Graduation', description: 'Easy Peasy')
c5 = l2.cards.create(title: 'Job Hunt', description: 'Upcoming')
c6 = l2.cards.create(title: 'Schtuff', description: 'ouchy')

c7 = l3.cards.create(title: 'squats', description: 'feel the burn')
c8 = l3.cards.create(title: 'pushups', description: 'ooh ouch')
c9 = l3.cards.create(title: 'situps', description: 'ouchy')

i1 = c1.items.create(done: false, title: 'mocha')
i2 = c1.items.create(done: true, title: 'mocha')
i3 = c1.items.create(done: true, title: 'cookie')

b1.members = [u2]
b1.save