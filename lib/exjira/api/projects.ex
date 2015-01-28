defmodule ExJira.API.Projects do
  @moduledoc """
  Exposes the Projects API interface.
  """

  import ExJira.API.Base

  def all do
    request(:get, "rest/api/2/project")
  end

  def find(id) do
    request(:get, "rest/api/2/project/#{id}")
  end

end