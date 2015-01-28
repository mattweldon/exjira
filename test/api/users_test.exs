defmodule UsersTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "find returns info for user given a username" do
    user = ExJira.API.Users.find("matt.weldon")

    assert user.displayName == "Matt Weldon"
    assert user.emailAddress != ""
    assert user.name != ""
  end

end
