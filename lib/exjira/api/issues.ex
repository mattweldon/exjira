defmodule ExJira.API.Issues do
  @moduledoc """
  Exposes the Issues API interface.
  """

  import ExJira.API.Base

  def find(id) do
    request(:get, "rest/api/2/issue/#{id}")
  end

end