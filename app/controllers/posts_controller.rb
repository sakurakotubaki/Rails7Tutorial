class PostsController < ApplicationController
  # def newとは、インスタンス変数@postにPostクラスのインスタンスを代入することを意味する
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end

  private
  def post_params
    params.require(:post).permit(:location, :text)
  end

end