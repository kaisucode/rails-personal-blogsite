class ArticlesController < ApplicationController

  # articles is the name of the controller
  # Article is the name of the model

  http_basic_authenticate_with name: "kevin", password: "123", 
    except: [:index, :show]

  class <<  self
    def markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end

  def index
    @articles = Article.all
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

  def show
    @article = Article.find(params[:id])
    @parsed_text = self.class.markdown.render(@article.text)
  end

  def admin
    @articles = Article.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
