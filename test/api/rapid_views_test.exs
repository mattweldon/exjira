defmodule RapidViewsTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "all returns info for all rapid views on the account" do
    rapid_views = ExJira.API.RapidViews.all
    
    assert Enum.count(rapid_views.views) > 0

    rapid_view = rapid_views.views |> List.first

    assert rapid_view.id != ""
    assert rapid_view.name != ""
    assert rapid_view.filter.query != ""
  end

end
