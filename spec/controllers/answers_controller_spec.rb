require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user ) }
  before { login(user) }

  describe 'Post #create' do

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
end
