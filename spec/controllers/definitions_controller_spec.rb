require 'spec_helper'

describe DefinitionsController do  
  context 'routing' do
    it {should route(:post, '/definitions').to :action => :create}
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:text => 'a tasty food', :part_of_speech => 'noun' }}
      let(:valid_parameters) {{:definition => valid_attributes}}

      it 'creates a new definition' do
        expect {post :create, valid_parameters}.to change(Definition, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created definition' do
        response.body.should eq Definition.find(JSON.parse(response.body)['definition']['id']).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:text => '', :part_of_speech =>''}}
      let(:invalid_parameters) {{:definition => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Definition.create(invalid_attributes).errors.to_json
      end
    end
  end
end