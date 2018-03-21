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
		# binding.pry
		# コンソールに入りたい場所でbinding.pryを記述
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		blog = Blog.find(params[:id])
		blog.update(blog_params)
		redirect_to "/blogs/#{blog.id}"
		# redirect_to blog_path(blog.id)
		# rake routesで確認できるprefixを使用
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to blogs_path
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :body, :category, :blog_image)
			# viewから送信されたデータはparamsというメソッドの中に入っている
			# ストロングパラメータは、セキュリティを強固にしているもの
		end
end
