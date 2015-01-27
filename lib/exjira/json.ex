defmodule ExJira.Json do
  @moduledoc """
  JSON encode/decode wrapper module.
  """

  @doc """
  Decode json string into elixir objects.
  """
  def decode!(json) do
    Poison.decode!(json, keys: :atoms)
  end

  @doc """
  Get elixir object for the specified key.
  Some libraries returns as tuples, and some returns HashDict.
  """
  def get(object, key) do
    Map.get(object, key, [])
  end

end