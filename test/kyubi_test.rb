require "test_helper"
require "minitest/mock"

class TagHelperTest < ActionView::TestCase
  def controller_mock(controller, action)
    mock = MiniTest::Mock.new
    mock.expect(:controller_name, controller)
    mock.expect(:action_name, action)
    mock
  end

  test "kyubi_stylesheet_link_tag" do
    @view = ActionView::Base.new
    @view.controller = controller_mock("home", "index")
    assert_equal(
      @view.stylesheet_link_tag("home/shared", "home/index", media: "all"),
      @view.kyubi_stylesheet_link_tag(media: "all")
    )
  end

  test "kyubi_javascript_include_tag" do
    @view = ActionView::Base.new
    @view.controller = controller_mock("home", "index")
    assert_equal(
      @view.javascript_include_tag("index", "data-turbolinks-track" => "reload"),
      @view.kyubi_javascript_include_tag("data-turbolinks-track" => "reload")
    )
  end

  test "kyubi_javascript_include_tag when no action file" do
    @view = ActionView::Base.new
    @view.controller = controller_mock("home", "index2")
    assert_nil(@view.kyubi_javascript_include_tag("data-turbolinks-track" => "reload"))
  end

  test "kyubi_javascript_include_tag when no controller directory" do
    @view = ActionView::Base.new
    @view.controller = controller_mock("top", "index")
    assert_nil(@view.kyubi_javascript_include_tag("data-turbolinks-track" => "reload"))
  end
end
