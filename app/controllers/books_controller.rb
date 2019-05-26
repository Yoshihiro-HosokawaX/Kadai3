class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end

    # 一覧＆top
    def index
        # 記事を全件取得
        @books = Book.all
         # 新規データ登録用に生成
        @book = Book.new
    end

    # book ローカル変数(アクション内でしか利用できない)
    def create
        book = Book.new(book_params)
        book.save
        if book.save
            flash[:notice] = "Book was successfully created."  #成功メッセージを代入
            redirect_to book_path(book.id)  #showのページにリダイレクト
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        if book.update(book_params)
            flash[:notice] = "Book was successfully updated."  #成功メッセージを代入
            redirect_to book_path(book.id)  #showのページにリダイレクト
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        if book.destroy
            flash[:notice] = "Book was successfully destroyed."  #成功メッセージを代入
            redirect_to books_path  #indexのページにリダイレクト
        end
    end


    # ストロングパラメーター(メソッド名は「モデル名_paramsが多い)
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end


end
