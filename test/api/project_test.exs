defmodule ProjectTest do
  use ExUnit.Case, async: false

  setup_all do
    ExJira.Test.standard_credentials |> ExJira.Config.set

    :ok
  end

  test "all returns more than 1 project" do
    assert Enum.count(ExJira.API.Projects.all) > 1
  end

  test "all returns summary info about each project" do 
    project = ExJira.API.Projects.all |> List.first
    assert project.avatarUrls != ''
    assert project.id != ''
    assert project.key != ''
    assert project.name != ''
  end

end
