class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :show, :index ]
  before_action :correct_user!, only: [ :edit, :update, :destroy ]
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
    def correct_user!
      @article = Article.find_by(id: params[:id])
      if  !current_user.nil? &&  @article.user.id != current_user.id
        render :file => "#{Rails.root}/public/422.html",  layout: false, status: 422
      end
    end
end
