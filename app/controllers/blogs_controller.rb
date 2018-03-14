class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end
	def new
		@blog = Blog.new
		# @つけると、対応するviewで使える
		# ブログモデルと紐付いた（データを入れる）空の箱を定義
		# インスタンスと言う。
	end
	def create
		blog = Blog.new(blog_params)
		# ビューから送られてきたデータをblogという空き箱に入れている
		blog.save
		redirect_to "/blogs"
		# 他のviewに移動するメソッド
	end

	def show
		@blog = Blog.find(params[:id])
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :body, :category)
			# viewから送信されたデータはparamsというメソッドの中に入っている
			# ストロングパラメータは、セキュリティを強固にしているもの
		end
end
