defmodule ExJira.ConfigTest do
  use ExUnit.Case

  test "global config initialization" do
    oauth = 
      [ site: "http://exjira.atlassian.net",
        private_key_file: "private_key.pem",
        consumer_key: "sample_consumer_key" ]

    ExJira.Config.set(oauth)

    assert ExJira.Config.current_scope == :global
    assert ExJira.Config.get == oauth
  end

  test "process-based config initialization" do
    current_pid = self
    
    test_fun = fn(test_pid, config) ->
      spawn(fn() ->
        ExJira.Config.set(:process, config)
        send(test_pid, {ExJira.Config.current_scope, ExJira.Config.get})
        exit(:normal)
      end)
    end

    test_fun.(current_pid, [conf: :process1])
    test_fun.(current_pid, [conf: :process2])

    assert_receive {:process, [conf: :process1]}
    assert_receive {:process, [conf: :process2]}
  end
end
