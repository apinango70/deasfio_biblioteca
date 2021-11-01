require "test_helper"

class BibliotecasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bibliotecas_index_url
    assert_response :success
  end

  test "should get control" do
    get bibliotecas_control_url
    assert_response :success
  end

  test "should get registro" do
    get bibliotecas_registro_url
    assert_response :success
  end
end
