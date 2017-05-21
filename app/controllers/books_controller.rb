class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action -> {check_permissions('admin', 'operator')}, except: [:show, :index]
  skip_before_action :check_app_auth, only: [:show, :index]
  skip_before_filter :require_login, :only => [:show, :index]

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
    # ВНИМАНИЕ КОСТЫЛЬ
    # выдираем из массива параметров данные с теми авторами,
    # которые уже были в БД, но еще не были добавлены для этой книги
    existing_authors_ids = []
    if params[:book].has_key?(:authors_attributes)
      params[:book][:authors_attributes].each do |k,v|
        current = v
        if current[:_destroy]=="false" && !current[:id].empty?
          #  raise current.inspect
          tmp = params[:book][:authors_attributes].delete(k)
          existing_authors_ids << tmp[:id]
        end
      end
    end

    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        # ПРОДОЛЖЕНИЕ КОСТЫЛЯ
        existing_authors_ids.each do |id|
          author = Author.find(id)
          @book.authors << author
        end

        format.html { redirect_to @book, t('notice.book.update') }
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
    # ВНИМАНИЕ КОСТЫЛЬ
    # выдираем из массива параметров данные с теми авторами,
    # которые уже были в БД, но еще не были добавлены для этой книги
    existing_authors_ids = []
    if params[:book].has_key?(:authors_attributes)
      params[:book][:authors_attributes].each do |k,v|
        current = v
        if k.to_i > @book.authors.count  &&
           current[:_destroy]=="false" && !current[:id].empty?
          #  raise current.inspect
          tmp = params[:book][:authors_attributes].delete(k)
          existing_authors_ids << tmp[:id]
        end
      end
    end
    # raise tmp.to_s
    # raise book_params.to_s
    respond_to do |format|
      if @book.update(book_params)
        # ПРОДОЛЖЕНИЕ КОСТЫЛЯ
        existing_authors_ids.each do |id|
          author = Author.find(id)
          @book.authors << author
        end

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
    # raise params.to_s
    @author = Author.where(id: params[:author_id]).first
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      # raise params.to_s
      params.require(:book).permit(:name, :volume, :isbn, :quantity,
        # authors: [],
        # author_ids: [],
          authors_attributes: Author.attributes_names.map(&:to_sym).push(:_destroy),
          locations_attributes: [:id, :shelf_id, :book_id, :rack_number, :_destroy] )
    end
end
