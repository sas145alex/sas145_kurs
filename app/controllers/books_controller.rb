class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action -> {check_permissions('admin', 'operator')}, except: [:show, :index]
  skip_before_action :check_app_auth, only: [:show, :index]
  skip_before_filter :require_login, :only => [:show, :index]

  def search
    # raise params.to_s
    if params.has_key?(:search)
      @books = Book.search(search_params)
      render 'search_result' and return
    else
      @books = []
    end
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    # raise params.to_s
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        # format.html { redirect_to @book, t('notice.book.update') }
        format.html { redirect_to @book }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    # raise params.to_s
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: t('notice.book.update') }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: t('notice.book.destroy') }
      format.json { head :no_content }
    end
  end

  def fill_author_form
    # raise "ПАРАМЕТРЫ #{params.to_s}"
    @author = Author.where(id: params[:author_id]).first
    @timestamp = params[:timestamp].to_i
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      # raise params.to_s
      @book = Book.find(params[:id])
    end

    def search_params
      params.require(:search).permit(
        book:     Book.attributes_names.map(&:to_sym),
        author:   Author.attributes_names.map(&:to_sym),
        location: Location.attributes_names.map(&:to_sym),
        shelf:    Shelf.attributes_names.map(&:to_sym),
        hall:     Hall.attributes_names.map(&:to_sym)
      )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      # raise params.to_s
      params.require(:book).permit(:name, :volume, :isbn, :quantity,
          author_books_attributes: [:_destroy, :author_id, :id,
            author_attributes: Author.attributes_names.map(&:to_sym).push(:_destroy)],
          locations_attributes: [:id, :shelf_id, :book_id, :rack_number, :_destroy] )
    end
end
