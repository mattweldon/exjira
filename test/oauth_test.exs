defmodule ExJira.OAuthTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.oauth_credentials |> ExJira.Config.set

    :ok
  end

  test "token request returns :ok"  do
    assert ExJira.OAuth.get_request_token == :ok
  end

  test "token request adds keys to config store" do
    ExJira.OAuth.get_request_token

    assert ExJira.Config.get[:oauth_token] != ''
    assert ExJira.Config.get[:oauth_token_secret] != ''
  end

  test "access token request returns :ok" do
    ExJira.OAuth.get_request_token
    assert ExJira.OAuth.get_access_token == :ok
  end

  test "access token request adds keys to config store" do
    ExJira.OAuth.get_request_token
    ExJira.OAuth.get_access_token

    assert ExJira.Config.get[:access_token] != ''
    assert ExJira.Config.get[:access_token_secret] != '' 
  end

end