require 'rails_helper'

RSpec.describe Post, type: :model do
    context "Testing Post Validations" do
        User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
        subject { Post.create(author: User.first, title: 'Hello', text: 'This is my first post', comments_counter:0, likes_counter: 0) }
        
        before { subject.save}

        it "Title should be valid if it is Hello" do
            expect(subject).to be_valid 
        end

        it "Title should not be blank" do
            subject.title = nil
            expect(subject).to_not be_valid 
        end

        it "Title should not be '' " do
            subject.title = ""
            expect(subject).to_not be_valid 
        end

        it "Title should not be larger than 250 characters" do
            subject.title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dapibus felis at est mattis sagittis egestas eget arcu. Cras pulvinar commodo augue nec consequat. Mauris fermentum sagittis faucibus. Sed elementum blandit nunc, a mollis risus condimentum cursus. Etiam facilisis condimentum accumsan. Integer mattis turpis id metus commodo egestas. Donec interdum convallis iaculis. Integer quis arcu at dui aliquam vestibulum ac ullamcorper mi. In urna ex, vestibulum nec posuere non, faucibus eget purus. Aenean interdum blandit maximus. Cras id enim sit amet augue finibus consectetur. Aenean a sem in augue ultricies fringilla.
            Curabitur vitae est magna. Maecenas blandit dolor nec leo molestie, in placerat ligula sollicitudin. Quisque velit lectus, molestie nec euismod sed, consequat sit amet mi. Praesent non nunc quis nisl volutpat aliquam scelerisque at tortor. Donec lobortis est vel nisl porttitor consectetur. Proin quis bibendum risus. Integer ultricies tempor mi, non congue ante accumsan et. Sed ac blandit enim."
            expect(subject).to_not be_valid
        end

        it "Comments Counter should be a number >= 0" do
            expect(subject).to be_valid
        end

        it "Comments Counter should not be a number < 0" do
            subject.comments_counter = -1
            expect(subject).to_not be_valid
        end

        it "Comments should not be a nil" do
            subject.comments_counter = nil
            expect(subject).to_not be_valid
        end

        it "Comments should be a number" do
            subject.comments_counter = "a"
            expect(subject).to_not be_valid
        end

        it "Likes Counter should be a number >= 0" do
            expect(subject).to be_valid
        end

        it "Likes Counter should not be a number < 0" do
            subject.likes_counter = -1
            expect(subject).to_not be_valid
        end

        it "Likes Counter should not be a nil" do
            subject.likes_counter = nil
            expect(subject).to_not be_valid
        end

        it "Likes should be a number" do
            subject.likes_counter = "a"
            expect(subject).to_not be_valid
        end

        
    end
end