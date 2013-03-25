require 'spec_helper'

describe WordsController do  
  context 'routing' do
    it {should route(:post, '/words').to :action => :create}
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:entry => 'potpie'}}
      let(:valid_parameters) {{:word => valid_attributes}}

      it 'creates a new word entry' do
        expect {post :create, valid_parameters}.to change(Word, :count).by(1)
      end

      before {post :create, valid_parameters}
      
      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created contact' do
        response.body.should eq Word.find(JSON.parse(response.body)['word']['id']).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:entry => ''}}
      let(:invalid_parameters) {{:word => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Word.create(invalid_attributes).errors.to_json
      end
    end
  end
end