require 'spec_helper'

describe PostsController do
	describe 'POST create' do
		it "valid attributes, saves a Post" do
			expect {
				post :create, :post => {
					title: "Some title", content: "Some content"
				}
			}.to change(Post, :count).by(1)
		end

		it "missing attributes, doesn't save" do
			expect {
				post :create, :post => {
					title: "Some title"
				}
			}.to change(Post, :count).by(0)
		end

		it "missing attributes" do
			post :create, :post => {
					title: "Some title"
				}

			assert_template :new
		end
	end
end
