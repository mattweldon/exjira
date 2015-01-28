defmodule ExJira.API.Issues do
  @moduledoc """
  Exposes the Issues API interface.
  """

  import ExJira.API.Base

  def find(id) do
    request(:get, "issue/#{id}")
  end

end