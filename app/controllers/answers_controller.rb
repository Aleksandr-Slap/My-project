class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[ create ]

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to question_path(@question), notice: 'Your answer successfuly created.'
    else
      render "questions/show"
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end  

  def answer_params
    params.require(:answer).permit(:body)
  end
end
