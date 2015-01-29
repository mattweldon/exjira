defmodule SprintsTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "find by rapid view returns all sprints for the rapid view" do
    sprints = ExJira.API.Sprints.for_rapid_view(4)
  end

end
