class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = policy_scope(Article).paginate(page: params[:page], per_page: 5)
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
  end

  def show
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      flash[:notice] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new', status: :unprocessable_entity
      # So I can use @article in new because I'm rendering
      # it from the create method!
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @article
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
