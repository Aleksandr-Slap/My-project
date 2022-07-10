class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_question, only: %i[ create ]
  before_action :load_answer, only: %i[ destroy ]

  def create
    @answer = @question.answers.create(answer_params.merge(user: current_user))

    if @answer.save
      redirect_to question_path(@question), notice: 'Your answer successfuly created.'
    else
      render "questions/show"
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question, notice: 'Answer successfully deleted.'
  end  

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end   

  def answer_params
    params.require(:answer).permit(:body)
  end
end
