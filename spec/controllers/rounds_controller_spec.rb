require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.	If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.	There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.	Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RoundsController do

	# This should return the minimal set of attributes required to create a valid
	# Round. As you add validations to Round, be sure to
	# update the return value of this method accordingly.
	before(:each) do
		@compo = FactoryGirl.create(:compo)
	end
	def valid_attributes
		{:compo_id => @compo.id}
	end

  describe_access(
		:login => [:index, :destroy, :show, :new, :update, :create]
  ) do

		describe "GET index" do
			it "assigns all rounds as @rounds" do
				round = Round.create! valid_attributes
				get :index, {}
				assigns(:rounds).should eq([round])
			end
		end

		describe "GET show" do
			it "assigns the requested round as @round" do
				round = Round.create! valid_attributes
				get :show, {:id => round.to_param}
				assigns(:round).should eq(round)
			end
		end

		describe "GET new" do
			it "assigns a new round as @round" do
				get :new, {}
				assigns(:round).should be_a_new(Round)
			end
		end

		describe "GET edit" do
			it "assigns the requested round as @round" do
				round = Round.create! valid_attributes
				get :edit, {:id => round.to_param}
				assigns(:round).should eq(round)
			end
		end

		describe "POST create" do
			describe "with valid params" do
				it "creates a new Round" do
					expect {
						post :create, {:round => valid_attributes}
					}.to change(Round, :count).by(1)
				end

				it "assigns a newly created round as @round" do
					post :create, {:round => valid_attributes}
					assigns(:round).should be_a(Round)
					assigns(:round).should be_persisted
				end

				it "redirects to the created round" do
					post :create, {:round => valid_attributes}
					response.should redirect_to(Round.last)
				end
			end

			describe "with invalid params" do
				it "assigns a newly created but unsaved round as @round" do
					# Trigger the behavior that occurs when invalid params are submitted
					Round.any_instance.stub(:save).and_return(false)
					post :create, {:round => {}}
					assigns(:round).should be_a_new(Round)
				end

				it "re-renders the 'new' template" do
					# Trigger the behavior that occurs when invalid params are submitted
					Round.any_instance.stub(:save).and_return(false)
					post :create, {:round => {}}
					response.should render_template("new")
				end
			end
		end

		describe "PUT update" do
			describe "with valid params" do
				it "updates the requested round" do
					round = Round.create! valid_attributes
					# Assuming there are no other rounds in the database, this
					# specifies that the Round created on the previous line
					# receives the :update_attributes message with whatever params are
					# submitted in the request.
					Round.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
					put :update, {:id => round.to_param, :round => {'these' => 'params'}}
				end

				it "assigns the requested round as @round" do
					round = Round.create! valid_attributes
					put :update, {:id => round.to_param, :round => valid_attributes}
					assigns(:round).should eq(round)
				end

				it "redirects to the round" do
					round = Round.create! valid_attributes
					put :update, {:id => round.to_param, :round => valid_attributes}
					response.should redirect_to(round)
				end
			end

			describe "with invalid params" do
				it "assigns the round as @round" do
					round = Round.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					Round.any_instance.stub(:save).and_return(false)
					put :update, {:id => round.to_param, :round => {}}
					assigns(:round).should eq(round)
				end

				it "re-renders the 'edit' template" do
					round = Round.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					Round.any_instance.stub(:save).and_return(false)
					put :update, {:id => round.to_param, :round => {}}
					response.should render_template("edit")
				end
			end
		end

		describe "DELETE destroy" do
			it "destroys the requested round" do
				round = Round.create! valid_attributes
				expect {
					delete :destroy, {:id => round.to_param}
				}.to change(Round, :count).by(-1)
			end

			it "redirects to the rounds list" do
				round = Round.create! valid_attributes
				delete :destroy, {:id => round.to_param}
				response.should redirect_to(rounds_url)
			end
		end
	end
end
