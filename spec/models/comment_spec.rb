require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Increments comments_counter four times' do
    user = User.create!(name: 'Samuel Amkam', photo: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80', bio: 'WebAvenger and MCU addict', posts_counter: 0)
    post = Post.create(author: user, title: 'Samuel Amkam, a WebAvenger.', comments_counter: 218, likes_counter: 97)
    comment = Comment.create(author: user, post: post, text: 'The test comment for testing')
    comment.update_comment_counter
    comment.update_comment_counter
    comment.update_comment_counter
    comment.update_comment_counter
    expect(post.comments_counter).to be 222
  end
end