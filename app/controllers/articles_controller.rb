class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
  end

  def show
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = 'Article was successfully created'
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity
      # So I can use @article in new because I'm rendering
      # it from the create method!
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
