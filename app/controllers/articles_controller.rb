class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
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
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end
  def edit
  end
  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end
  def destroy
    @article.destroy
    redirect_to root_path(@article)
  end

  private

  def article_params
    #params.require(dynamic_id_for_the_model).permit(fields_required)
    params.require(:article).permit(:title, :content)
  end
  def find_article
    @article = Article.find(params[:id])
  end
end
