class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<%= @test.questions.inspect %>'
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def show
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end

  private

  def  question_params
    params.require(:questions).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question is not found'
  end
end
