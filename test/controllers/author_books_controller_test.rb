require 'test_helper'

class AuthorBooksControllerTest < ActionController::TestCase
  setup do
    @author_book = author_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_book" do
    assert_difference('AuthorBook.count') do
      post :create, author_book: { author_id: @author_book.author_id, book_id: @author_book.book_id }
    end

    assert_redirected_to author_book_path(assigns(:author_book))
  end

  test "should show author_book" do
    get :show, id: @author_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author_book
    assert_response :success
  end

  test "should update author_book" do
    patch :update, id: @author_book, author_book: { author_id: @author_book.author_id, book_id: @author_book.book_id }
    assert_redirected_to author_book_path(assigns(:author_book))
  end

  test "should destroy author_book" do
    assert_difference('AuthorBook.count', -1) do
      delete :destroy, id: @author_book
    end

    assert_redirected_to author_books_path
  end
end
