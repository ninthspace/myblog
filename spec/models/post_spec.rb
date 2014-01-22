require 'spec_helper'

describe Post do
  describe '#build' do
  	context 'valid attributes' do
  	  it 'must have a title and content' do
  	  	post = build(:post)
  	  	post.should be_valid
  	  end
  	 end

    context 'missing attributes' do
      it 'is invalid' do
      	post = build(:post, title: "");
      	post.should_not be_valid

      	post = build(:post, content: "");
      	post.should_not be_valid
      end
    end
  end

  describe "#create" do
  	context 'valid attributes' do
  	  it 'saves post' do
  	  	expect {
  	  		post = create(:post)
  	  	}.to change(Post, :count).by(1)  	  	
  	  end

  	  it 'gets an id' do
  	  	post = create(:post)
  	  	post.id.should_not eq(nil)
  	  end
  	 end

    context 'missing attributes' do
      it 'it doesnt save post' do
      	post = build(:post, title: "");
      	post.id.should eq(nil)

      	post = build(:post, content: "");
      	post.id.should eq(nil)
      end
    end
  end
end
