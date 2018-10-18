# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all

# User.create(nickname:"user1",email:"user1@gmail.com",icon:"user1.jpg",user_level:1,header_background:"user1_back.jpg",blog_open:"o",password:"user1")
# User.create(nickname:"user2",email:"user2@gmail.com",icon:"user2.jpg",user_level:1,header_background:"user1_back.jpg",blog_open:"o",password:"user2")
# User.create(nickname:"user3",email:"user3@gmail.com",icon:"user3.jpg",user_level:1,header_background:"user1_back.jpg",blog_open:"o",password:"user3")
# User.create(nickname:"user4",email:"user4@gmail.com",icon:"user4.jpg",user_level:1,header_background:"user1_back.jpg",blog_open:"o",password:"user4")
# User.create(nickname:"user5",email:"user5@gmail.com",icon:"user5.jpg",user_level:1,header_background:"user1_back.jpg",blog_open:"o",password:"user5")


Blog.delete_all
Blog.create(user_id:14,title:"blog14",content:"natsumi14-content1",status:0)
Blog.create(user_id:15,title:"blog15",content:"user15-content",status:0)
Blog.create(user_id:16,title:"blog16",content:"natsumi16-content2",status:0)
Blog.create(user_id:17,title:"blog17",content:"user17-content",status:0)
Blog.create(user_id:18,title:"blog18",content:"user18-content",status:0)

Friend.delete_all
Friend.create(follower:14,followed:15)
Friend.create(follower:14,followed:16)
Friend.create(follower:16,followed:14)