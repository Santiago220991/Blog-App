require 'rails_helper'

RSpec.describe Comment, type: :model do
    context "Testing Like Methods" do
        user=User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
        user.save
        post=Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter:0, likes_counter: 0)
        post.save
        comment=Comment.create(post: post, author: user, text: 'Hi Tom first!' )
        comment.save


        it "author_id should be equal to user_id" do
            expect(comment.author_id).to eq (user.id)
        end

        it "post_id should be equal to Post.id" do
            expect(comment.post_id).to eq (post.id)
        end
    end
    context "Testing Comment Validations" do
        user=User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
        post=Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter:0, likes_counter: 0)
        subject {Comment.create(post: post, author: user, text: 'Hi Tom first!' )}
        before{subject.save}
        
        it "Text should not be longer than 250 characters" do
            expect(subject).to be_valid
        end  

        it "Text should not be longer than 250 characters" do
            subject.text= "a"*251
            expect(subject).to_not be_valid
        end  
    end
end