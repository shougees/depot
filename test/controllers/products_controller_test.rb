require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:        'Lorem Ipsum', 
      description:  'Wibbles are fun!', 
      image_url:    'lorem.jpg', 
      price:        19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: {  title: @product. title, description: @product.description, 
        image_url: @product.image_url, price: @product.price }, product: @update

    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: {  title: @product. title, description: @product.description, 
      image_url: @product.image_url, price: @product.price }, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  test "should have div with id product_list being displayed" do
    assert_select '.list_actions' do |elements|
      elements.each do |element|
        assert_select element, "link_to", 3
      end
    end
  end
end
