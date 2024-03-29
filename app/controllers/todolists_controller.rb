class TodolistsController < ApplicationController
  def new
    # 　Viewへ渡すためのインスタンス変数にからのオブジェクトを生成する。
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save # データベースへ保存する
    redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
