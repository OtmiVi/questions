class AnswersController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_question!, only: [ :create ]
  before_action :set_answer!, only: [ :destroy, :edit, :update ]
  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render "questions/show"
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:success] = "Answer Deleted!"
    redirect_to question_path(@question)
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end
  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = "Answer Updated!"
      redirect_to question_path(@question, anchor: dom_id(@answer))
    else
      render "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit :body
  end

  def set_question!
    @question = Question.find params[:question_id]
  end

  def set_answer!
    set_question!
    @answer = @question.answers.find(params[:id])
  end
end
