defmodule ExJira.API.Search do
  @moduledoc """
  Exposes the Search API interface.
  """

  import ExJira.API.Base

  def using_jql(jql) do
    request(:get, "rest/api/2/search", [ jql: jql ])
  end

end