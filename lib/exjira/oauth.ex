defmodule ExJira.OAuth do

  @doc """
  Requests a new set of access tokens.
  """
  def request_token do
    config = ExJira.Config.get_tuples
    consumer = {config[:consumer_key], config[:private_key_file], :rsa_sha1}

    token_request_url = "#{config[:site]}/plugins/servlet/oauth/request-token"
    {:ok, request_token_response} = :oauth.post(to_char_list(token_request_url), [], consumer)
    
    updated_config = :oauth.params_decode(request_token_response) 
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