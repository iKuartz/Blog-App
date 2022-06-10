# Create two users
first_user = User.create(name: 'Terrosvaldo',
                         photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                         bio: 'Artificer from Cormyr.')
second_user = User.create(name: 'Princess Ericha Drachensbäene',
                          photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                          bio: 'Princess from Damara.')

# Create four posts
first_post = Post.create(author: first_user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello 2', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello 3', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello 4', text: 'This is my fourth post')

# Create comments
Comment.create(post: first_post, author: second_user, text: 'Hi Terrosvaldo!')
Comment.create(post: first_post, author: first_user, text: 'Hi Ericha!')
Comment.create(post: first_post, author: second_user, text: 'How r u doing?')
Comment.create(post: first_post, author: first_user, text: 'Great, what about u?')
Comment.create(post: first_post, author: second_user, text: 'Pretty good')
Comment.create(post: first_post, author: first_user, text: 'Goodbye')

Comment.create(post: second_post, author: second_user, text: 'Hello!')
Comment.create(post: second_post, author: first_user, text: 'Hello Ericha!!!')
Comment.create(post: third_post, author: second_user, text: 'Nice post, Terrosvaldo!')

# Like posts
Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: second_user)
Like.create(post: second_post, author: second_user)
