class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action -> { check_ownership(@article.user) }, only: [:edit, :create, :update, :destroy]

  respond_to :html

  def index
    @articles = Article.all
    @admin = (current_user and current_user.admin?)
    
    respond_with(@articles)
  end

  def show
    @comments = Comment.where(article: params[:id])
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:user_id, :content, :title, :description)
    end
end
