defmodule ExJira.API.RapidViews do
  @moduledoc """
  Exposes the RapidViews API interface.
  """

  import ExJira.API.Base

  def all do
    request(:get, "rest/greenhopper/latest/rapidviews/list")
  end

end