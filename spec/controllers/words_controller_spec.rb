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

      before {post :create}
      it {should respond_with 200}
    end
  end
end