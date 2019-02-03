class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "Name", password: "P@ssw0rd", except: [:index, :show]

  # Basically the same as Actions/Methods.
  # We usually order the CRUD actions by: index; show; new; edit; create; update; & destroy.
  
  # Found on http://localhost:3000/articles/
  def index
    @articles = Article.all
  end
  
  # Found on http://localhost:3000/articles/[id]
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  # Private means it can't be called outside its intended context.
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
