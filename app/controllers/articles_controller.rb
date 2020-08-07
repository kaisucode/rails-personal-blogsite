class ArticlesController < ApplicationController
  def index
    @blogposts = ["aug-4-intro", "aug-8", "nov-4"]
  end

  def show
    render ("articles/blog/" + params[:id].to_s + ".html")
  end
end
