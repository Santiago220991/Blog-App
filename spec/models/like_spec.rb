require 'rails_helper'

RSpec.describe Like, type: :model do
    context "Testing Like Validations" do
        User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
        Post.create(author: User.first, title: 'Hello', text: 'This is my first post', comments_counter:0, likes_counter: 0)
        subject {Like.create(post: Post.first, author: User.first)}
        
        before { subject.save}

        it "author_id should be a number >= 0" do
            expect(subject).to be_valid
        end

        it "author_id should not be a number < 0" do
            subject.author_id = -1
            expect(subject).to_not be_valid
        end

        it "author_id should not be a nil" do
            subject.author_id = nil
            expect(subject).to_not be_valid
        end

        it "author_id should be a number" do
            subject.author_id = "a"
            expect(subject).to_not be_valid
        end

        it "post_id should be a number >= 0" do
            expect(subject).to be_valid
        end

        it "post_id should not be a number < 0" do
            subject.post_id = -1
            expect(subject).to_not be_valid
        end

        it "post_id should not be a nil" do
            subject.post_id = nil
            expect(subject).to_not be_valid
        end

        it "post_id be a number" do
            subject.post_id = "a"
            expect(subject).to_not be_valid
        end

        
    end
end