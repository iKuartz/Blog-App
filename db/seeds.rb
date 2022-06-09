# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'John Smith', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', bio: 'Doctor from Brazil.')
third_user = User.create(name: 'Noah', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', bio: 'Pilot from Germany.')
fourth_user = User.create(name: 'Ann Charlotte', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', bio: 'Lawyer from Ghana.')

# Posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hi', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hi there', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello!', text: 'This is my fourth post')

# Comments
Comment.create(author_id: first_user, text: 'Lorem officia deserunt mollit anim id est laborum.', posts_id: first_post)
Comment.create(posts_id: first_post, author_id: second_user, text: 'Hi Tom!')
Comment.create(posts_id: first_post, author_id: first_user, text: 'Great Post')
Comment.create(posts_id: second_post, author_id: fourth_user, text: 'Nice Content, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
Comment.create(posts_id: third_post, author_id: third_user, text: 'Hello there!')
Comment.create(posts_id: first_post, author_id: first_user, text: 'Hi, Lorem ipsum dolor sit amet')
Comment.create(posts_id: first_post, author_id: first_user, text: 'Hello, Lorem ipsum dolor sit amet')
Comment.create(posts_id: fourth_post, author_id: first_user, text: 'Like the post, Lorem ipsum dolor sit amet')
Comment.create(posts_id: first_post, author_id: first_user, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
Comment.create(posts_id: first_post, author_id: first_user, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
