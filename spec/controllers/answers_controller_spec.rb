require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user ) }

  describe 'Post #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new answer in the database' do
        expect {post :create, params: {question_id: question, answer: attributes_for(:answer) } }.to change(Answer, :count).by(1)
      end
      it 'redirect to show question' do
        post :create, params: {question_id: question, answer: attributes_for(:answer) } 
        expect(response).to redirect_to assigns(:question)
      end  
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect {post :create, params: {question_id: question, answer: attributes_for(:answer, :invalid) } }.to_not change(Answer, :count)
      end  
      it 're-renders new view' do
        post :create, params: {question_id: question, answer: attributes_for(:answer, :invalid) }
        expect(response).to render_template 'questions/show'
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }

    let!(:answer) { create(:answer, question: question, user: user)}

    it 'delete in answer' do 
      expect {delete :destroy, params: { id: answer } }.to change(Answer, :count).by(-1)
    end
  end
end
