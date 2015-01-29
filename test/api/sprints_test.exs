defmodule SprintsTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "list by rapid view returns all sprints for the rapid view" do
    sprint_list = ExJira.API.Sprints.list_for_rapid_view(4)
    assert sprint_list.rapidViewId == 4
    assert Enum.count(sprint_list.sprints) > 0

    sprint_summary = List.first(sprint_list.sprints)
    assert sprint_summary.id == 6
    assert sprint_summary.name != ""
  end


  test "find by rapid view and sprint id returns full sprint info for the sprint associated with the rapid view" do
    sprint = ExJira.API.Sprints.find_by_rapid_view_and_sprint_id(4, 6)

    assert sprint.contents.allIssuesEstimateSum.text == "50.0"
    assert Enum.count(sprint.contents.completedIssues) == 0
    assert Enum.count(sprint.contents.incompletedIssues) > 0
  end


end
