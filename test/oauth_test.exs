defmodule ExJira.OAuthTest do
  use ExUnit.Case

  setup_all do
    ExJira.Test.oauth_credentials |> ExJira.Config.set

    :ok
  end

  test "token request returns :ok"  do
    assert ExJira.OAuth.request_token == :ok
  end

  test "token request adds keys to config store" do
    ExJira.OAuth.request_token

    assert ExJira.Config.get[:oauth_token] != ''
    assert ExJira.Config.get[:oauth_token_secret] != ''
  end

end
