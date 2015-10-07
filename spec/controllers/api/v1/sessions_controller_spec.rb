require 'spec_helper'
#require 'rails_helper
#RSpec.describe UserNamesController, type: :controller do
RSpec.describe Api::V1::SessionsController, type: :controller do
	
	describe "Post #create" do

		before(:each) do
			@user = FactoryGirl.create :user
		end

		context "when the credentials are correct" do

			before(:each) do
				credentials = { email: @user.email, password: "12345678" }
				post :create, { session: credentials }
			end

			it "returns the user record corresponding to the given credentials" do
				@user.reload
				expect(json_response[:user][:auth_token]).to eql @user.auth_token
			end

			it { should respond_with 200 }
		end

		context "when the credentials are incorrect" do

			before(:each) do
				credentials = { email: @user.email, password: "invalidpass" }
				post :create, { session: credentials }
			end

			it { should respond_with 422 }
		end
	end

	describe "Delete #destroy" do

		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
			delete :destroy, id: @user.auth_token
		end

		it { should respond_with 204 }

	end
end
