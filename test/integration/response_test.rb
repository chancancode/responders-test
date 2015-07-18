require 'test_helper'

class ResponseTest < ActionDispatch::IntegrationTest

  # TestController#html_only

  test "requesting default content when only HTML template exists" do
    get "/test/html_only"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_only.html.erb</code>"
  end

  test "requesting HTML content when only HTML template exists" do
    get "/test/html_only.html"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_only.html.erb</code>"
  end

  test "requesting JSON content when only HTML template exists" do
    get "/test/html_only.json"

    assert_equal 406, response.status
  end


  # TestController#json_only

  test "requesting default content when only JSON template exists" do
    get "/test/json_only"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"json_only.json.jbuilder"}'
  end

  test "requesting HTML content when only JSON template exists" do
    get "/test/json_only.html"

    assert_equal 406, response.status
  end

  test "requesting JSON content when only JSON template exists" do
    get "/test/json_only.json"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"json_only.json.jbuilder"}'
  end


  # TestController#html_and_json

  test "requesting default content when both HTML and JSON templates exist" do
    get "/test/html_and_json"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_and_json.html.erb</code>"
  end

  test "requesting HTML content when both HTML and JSON templates exist" do
    get "/test/html_and_json.html"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_and_json.html.erb</code>"
  end

  test "requesting JSON content when both HTML and JSON templates exist" do
    get "/test/html_and_json.json"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"html_and_json.json.jbuilder"}'
  end

  test "requesting XML content when both HTML and JSON templates exist" do
    get "/test/html_and_json.xml"

    assert_equal 406, response.status
  end


  # TestController#no_templates

  test "requesting default content when no templates exist" do
    get "/test/no_templates"

    assert_equal 204, response.status
    assert response.content_type.html?
    assert_predicate response.body, :empty?
  end

  test "requesting HTML content when no templates exist" do
    get "/test/no_templates.html"

    assert_equal 204, response.status
    assert response.content_type.html?
    assert_predicate response.body, :empty?
  end

  test "requesting JSON content when no templates exist" do
    get "/test/no_templates.json"

    assert_equal 204, response.status
    assert response.content_type.json?
    assert_predicate response.body, :empty?
  end


  # TestController#html_template_only

  test "requesting default content when only HTML template exists (with no corresponding controller method)" do
    get "/test/html_template_only"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_template_only.html.erb</code>"
  end

  test "requesting HTML content when only HTML template exists (with no corresponding controller method)" do
    get "/test/html_template_only.html"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>html_template_only.html.erb</code>"
  end

  test "requesting JSON content when only HTML template exists (with no corresponding controller method)" do
    get "/test/html_template_only.json"

    assert_equal 406, response.status
  end


  # TestController#json_template_only

  test "requesting default content when only JSON template exists (with no corresponding controller method)" do
    get "/test/json_template_only"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"json_template_only.json.jbuilder"}'
  end

  test "requesting HTML content when only JSON template exists (with no corresponding controller method)" do
    get "/test/json_template_only.html"

    assert_equal 406, response.status
  end

  test "requesting JSON content when only JSON template exists (with no corresponding controller method)" do
    get "/test/json_template_only.json"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"json_template_only.json.jbuilder"}'
  end


  # TestController#with_respond_to

  test "request default content from an action with a respond_to block" do
    get "/test/with_respond_to"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>with_respond_to.html.erb</code>"
  end

  test "request HTML content from an action with a respond_to block" do
    get "/test/with_respond_to.html"

    assert_equal 200, response.status
    assert response.content_type.html?
    assert_includes response.body, "<code>with_respond_to.html.erb</code>"
  end

  test "request JSON content from an action with a respond_to block" do
    get "/test/with_respond_to.json"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"respond_to"}'
  end

  test "request XML content from an action with a respond_to block" do
    get "/test/with_respond_to.xml"

    assert_equal 406, response.status
  end


  # TestController#with_explicit_render

  test "request HTML content from an action with an explicit render call" do
    get "/test/with_explicit_render.html"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"render"}'
  end

  test "request JSON content from an action with an explicit render call" do
    get "/test/with_explicit_render.json"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"render"}'
  end

  test "request XML content from an action with an explicit render call" do
    get "/test/with_explicit_render.xml"

    assert_equal 200, response.status
    assert response.content_type.json?
    assert_includes response.body, '{"source":"render"}'
  end

end
