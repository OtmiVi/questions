class AnswersController < ApplicationController
  before_action :set_question!, only: [ :create, :destroy ]
  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:success] = "Answer Deleted!"
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit :body
  end

  def set_question!
    @question = Question.find params[:question_id]
  end
end
