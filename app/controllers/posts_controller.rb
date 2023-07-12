class PostsController < ApplicationController
  # def newとは、インスタンス変数@postにPostクラスのインスタンスを代入することを意味する
  def new
    @post = Post.new
  end
  # def indexとは、インスタンス変数@postsにPostクラスの全てのインスタンスを代入することを意味する
  def index
    @posts = Post.all
  end
  # def createとは、インスタンス変数@postにPostクラスのインスタンスを代入し、saveメソッドを実行することを意味する
  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end
  # def showとは、インスタンス変数@postにPostクラスのインスタンスを代入することを意味する
  private
  def post_params
    params.require(:post).permit(:location, :text)
  end

end