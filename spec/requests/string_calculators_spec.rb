require 'rails_helper'

RSpec.describe StringCalculatorsController, type: :controller do
  describe "GET #new" do
    it "assigns a new StringCalculator and renders new template" do
      get :new
      expect(assigns(:string_calculator)).to be_a_new(StringCalculator)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) { { string_calculator: { input_string: "1,2,3" } } }

      it "creates a new StringCalculator" do
        expect {
          post :create, params: valid_params
        }.to change(StringCalculator, :count).by(1)
      end

      it "redirects to the show page with notice" do
        post :create, params: valid_params
        expect(response).to redirect_to(StringCalculator.last)
        expect(flash[:notice]).to eq("Calculation successful!")
      end
    end

    context "with invalid parameters (model validation fails)" do
      let(:invalid_params) { { string_calculator: { input_string: "" } } }

      it "does not create a new record and re-renders new template" do
        expect {
          post :create, params: invalid_params
        }.not_to change(StringCalculator, :count)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(assigns(:string_calculator).errors).not_to be_empty
      end
    end

    context "when ArgumentError is raised during save" do
      before do
        allow_any_instance_of(StringCalculator).to receive(:save).and_raise(ArgumentError.new("Invalid format"))
      end

      it "rescues the error and adds it to errors" do
        post :create, params: { string_calculator: { input_string: "bad_input" } }

        expect(response).to render_template(:new)
        expect(assigns(:string_calculator).errors[:input]).to include("Invalid format")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
