defmodule ExJira.API.Users do
  @moduledoc """
  Exposes the Users API interface.
  """

  import ExJira.API.Base

  def find(username) do
    request(:get, "rest/api/2/user", [username: username])
  end

end