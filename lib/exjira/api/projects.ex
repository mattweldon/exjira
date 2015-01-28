defmodule ExJira.API.Projects do
  @moduledoc """
  Exposes the Projects API interface.
  """

  import ExJira.API.Base

  def all do
    request(:get, "project")
  end

  def find(id) do
    request(:get, "project/#{id}")
  end

end