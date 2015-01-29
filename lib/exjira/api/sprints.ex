defmodule ExJira.API.Sprints do
  @moduledoc """
  Exposes the Sprints API interface.
  """

  import ExJira.API.Base

  def list_for_rapid_view(rapid_view_id) do
    request(:get, "rest/greenhopper/latest/sprintquery/#{rapid_view_id}")
  end

  def find_by_rapid_view_and_sprint_id(rapid_view_id, sprint_id) do
    request(:get, "rest/greenhopper/latest/rapid/charts/sprintreport", [rapidViewId: rapid_view_id, sprintId: sprint_id])
  end

end