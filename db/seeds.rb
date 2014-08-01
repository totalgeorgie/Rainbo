u1 = User.create(email: 'george@gmail.com', given_name: 'George', surname: 'Ashworth', password: 'password')
u2 = User.create(email: 'andrew@gmail.com', given_name: 'Andrew', surname: 'Ashworth', password: 'password')
u3 = User.create(email: 'steven@gmail.com', given_name: 'Steven', surname: 'Ashworth', password: 'password')
u4 = User.create(email: 'proflower@proflo.ws', given_name: 'Professional', surname: 'Flower', password: 'password')

b1 = u1.boards.create(title: 'Demo Project: ProFlows')
b2 = u1.boards.create(title: 'D2Trader - Flask.py')
b3 = u1.boards.create(title: 'Symfony2 SSM')
b4 = u1.boards.create(title: 'Hertzler Digital Library Archive')

b1.add_member(u2)
b1.add_member(u3)
b1.add_member(u4)

l1 = b1.lists.create(title: 'Proposed')
l2 = b1.lists.create(title: 'Active')
l3 = b1.lists.create(title: 'Finished')
l4 = b1.lists.create(title: 'Accepted')
l5 = b1.lists.create(title: 'Rejected')

c0 = l1.cards.create(title: 'Purchase SSL Certificate', points: 4, status: :proposed, card_type: :feature)
c1 = l1.cards.create(title: 'Cache Activity Feed w/ Redis', points: 1, status: :proposed, card_type: :feature)
c2 = l1.cards.create(title: 'Define Keyboard Shortcuts', points: 2, status: :proposed, card_type: :feature)
c3 = l1.cards.create(title: 'Implement Voice Recognition', points: 1, status: :proposed, card_type: :feature)
c4 = l1.cards.create(title: 'Add SMS Notifications', points: 1, status: :proposed, card_type: :feature)
c5 = l1.cards.create(title: 'Host Node STUN/TURN Servers', points: 3, status: :proposed, card_type: :feature)
c6 = l1.cards.create(title: 'Document Developer API', points: 1, status: :proposed, card_type: :feature)
c7 = l1.cards.create(title: 'Allow Multi-Project Dashboards', points: 1, status: :proposed, card_type: :feature)

c8 = l2.cards.create(title: 'Add Conference Calling', points: 4, status: :active, card_type: :feature)
c9 = l2.cards.create(title: 'Implement Activity Feeds', points: 3, status: :active, card_type: :feature)
c10 = l2.cards.create(title: 'Add IFTTT/GitHub Webhooks', points: 2, status: :active, card_type: :feature)
c11 = l2.cards.create(title: 'Reach >90 PageSpeed Insight Score', points: 4, status: :active, card_type: :task)

c12 = l3.cards.create(title: 'Prepare for AppAcademy Demo', points: 4, status: :finished, card_type: :milestone)
c13 = l3.cards.create(title: 'Re-design Splash Page', points: 2, status: :finished, card_type: :feature)
c14 = l3.cards.create(title: 'Deploy to Heroku', points: 4, status: :finished, card_type: :task)
c14a = l3.cards.create(title: 'Protect API Keys w/ Figaro', points: 4, status: :finished, card_type: :task)

c15 = l4.cards.create(title: 'Add User Authentication', points: 4, status: :accepted, card_type: :feature)
c16 = l4.cards.create(title: 'Add E-Mail Verification', points: 1, status: :accepted, card_type: :feature)
c17 = l4.cards.create(title: 'Add Project Creation', points: 2, status: :accepted, card_type: :feature)
c18 = l4.cards.create(title: 'Add Project Memberships', points: 3, status: :accepted, card_type: :feature)
c19 = l4.cards.create(title: 'Add Panel Creation', points: 1, status: :accepted, card_type: :feature)
c20 = l4.cards.create(title: 'Add Panel Sorting/Motion', points: 4, status: :accepted, card_type: :feature)
c21 = l4.cards.create(title: 'Add Card Creation', points: 2, status: :accepted, card_type: :feature)
c22 = l4.cards.create(title: 'Add Card Sorting/Motion', points: 4, status: :accepted, card_type: :feature)
c23 = l4.cards.create(title: 'Add Object Creation Forms', points: 4, status: :accepted, card_type: :feature)
c24 = l4.cards.create(title: 'Add Project Index Page', points: 3, status: :accepted, card_type: :feature)
c25 = l4.cards.create(title: 'Add Project Sidebar', points: 2, status: :accepted, card_type: :feature)

c26 = l5.cards.create(title: 'Add SendGrid Mailer Integration', points: 2, status: :rejected, card_type: :feature)
c27 = l5.cards.create(title: 'Add Dependency Hierarchies', points: 4, status: :rejected, card_type: :feature)
c28 = l5.cards.create(title: 'Add CSS Transformations', points: 2, status: :rejected, card_type: :feature)
c29 = l5.cards.create(title: 'Add Auto-Generated Project Panels', points: 1, status: :rejected, card_type: :feature)