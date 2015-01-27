defmodule ExJira.OAuth do
  @moduledoc """
  A set of wrappers over the :oauth methods.
  """

  @doc """
  Sends a GET request.
  """
  def request(:get, url, params, consumer_tuple, access_token, access_token_secret) do
    :oauth.get(url, params, consumer_tuple, access_token, access_token_secret)
  end

  @doc """
  Sends a POST request.
  """
  def request(:post, url, params, consumer_tuple, access_token, access_token_secret) do
    :oauth.post(url, params, consumer_tuple, access_token, access_token_secret)
  end

  @doc """
  Requests a new set of request tokens.
  """
  def get_request_token do
    config = ExJira.Config.get_tuples
    consumer = { config[:consumer_key], config[:private_key_file], :rsa_sha1 }
    token_request_url = "#{config[:site]}/plugins/servlet/oauth/request-token"
    {:ok, request_token_response} = :oauth.post(to_char_list(token_request_url), [], consumer)

    updated_config = :oauth.params_decode(request_token_response) 
                      |> get_keyword_list 
                      |> Keyword.merge config

    ExJira.Config.set(updated_config)

    :ok
  end

  @doc """
  Returns the redirect url for authorizing the use of the request tokens.
  """
  def get_authorize_url do
    config = ExJira.Config.get_tuples
    :oauth.uri(to_char_list("#{config[:site]}/plugins/servletlet/oauth/authorize"), [{'oauth_token', config[:oauth_token]}])
  end

  @doc """
  Requests a new access token/access token secret pair.
  """
  def get_access_token do
    config = ExJira.Config.get_tuples
    consumer = { config[:consumer_key], config[:private_key_file], :rsa_sha1 }
    access_token_request_url = "#{config[:site]}/plugins/servlet/oauth/access-token"

    {:ok, access_token_response} = :oauth.post(to_char_list(access_token_request_url), [], consumer, config[:oauth_token], config[:oauth_token_secret])
    
    updated_config = :oauth.params_decode(access_token_response) 
                      |> get_keyword_list 
                      |> Keyword.merge config

    ExJira.Config.set(updated_config)

    :ok
  end

    defp get_keyword_list([]) do
      []
    end

    defp get_keyword_list(tokens) do
      tokens |> Enum.map(fn({k, v}) -> {k |> List.to_atom, to_char_list(v)} end)
    end

end