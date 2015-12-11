class FlashcardsController < ApplicationController
  
  def index
    @flashcards = Flashcard.all
  end

  def new
    @flashcard = Flashcard.new
  end

  def show
     @flashcard = Flashcard.find(params[:id])
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)
   
    if @flashcard.save
      redirect_to @flashcard
    else
      render 'new'
    end
  end

  private
    def flashcard_params
      params.require(:flashcard).permit(:title, :text)
    end

end
