defmodule IssuesTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "find returns info for an issue using an issue key" do
    issue = ExJira.API.Issues.find("FIVE-8")

    assert issue.key == "FIVE-8"
    assert issue.id != ""
    assert issue.fields.summary != ""
  end

  test "find returns info for an issue using an issue id" do
    issue = ExJira.API.Issues.find("11238")

    assert issue.key != ""
    assert issue.id == "11238"
    assert issue.fields.summary != ""
  end

end
