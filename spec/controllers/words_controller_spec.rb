require 'spec_helper'

describe WordsController do  
  context 'routing' do
    it {should route(:post, '/words').to :action => :create}
    it {should route(:get, '/words/1').to :action => :show, :id => 1}
    it {should route(:put, '/words/1').to :action => :update, :id => 1}
    it {should route(:delete, '/words/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/words').to :action => :index}
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:entry => 'potpie', :definition => 'a tasty food'}}
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
      let(:invalid_attributes) {{:entry => '', :definition => ''}}
      let(:invalid_parameters) {{:word => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Word.create(invalid_attributes).errors.to_json
      end
    end

    context 'GET show' do
      let(:word) {FactoryGirl.create :word}
      before {get :show, :id => word.id}

      it {should respond_with 200}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the word' do
        response.body.should eq word.to_json
      end
    end

    context 'PUT update' do
      let(:word) {FactoryGirl.create :word}

      context 'with valid parameters' do
        let(:valid_attributes) {{:entry => 'potpie', :definition => 'a tasty food'}}
        let(:valid_parameters) {{:id => word.id, :word => valid_attributes}}
        before {put :update, valid_parameters}

        it 'updates the word' do
          Word.find(word.id).entry.should eq valid_attributes[:entry]
        end

        it {should respond_with 200}
        it {should respond_with_content_type :json}
        it 'responds with a json representation of the updated word' do
          response.body.should eq word.reload.to_json
        end
      end

      context 'with invalid parameters' do
        let(:invalid_attributes) {{:entry => '', :definition => ''}}
        let(:invalid_parameters) {{:id => word.id, :word => invalid_attributes}}
        before {put :update, invalid_parameters}

        it {should respond_with 422}
        it {should respond_with_content_type :json}

        it 'responds with a json representation of the errors' do
          word.update_attributes(invalid_attributes)
          response.body.should eq word.errors.to_json
        end
      end

      context 'Delete destroy' do
        it 'destroys a word' do
          word = FactoryGirl.create :word
          expect {delete :destroy, {:id => word.id}}.to change(Word, :count).by(-1)
        end

        let(:contact) {FactoryGirl.create :word}
        before {delete :destroy, {:id => contact.id}}

        it {should respond_with 204}
      end
    end

    context 'GET index' do
      before {Word.create({:entry => 'potpie', :definition => 'a tasty food'})}
      before {get :index}

      it {should respond_with 200}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of all the words' do
        response.body.should eq Word.all.to_json
      end
    end
  end
end