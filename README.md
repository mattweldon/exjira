# ExJira

A JIRA client library for Elixir using <a href="https://github.com/tim/erlang-oauth/" target="_blank">erlang-oauth</a> to call the <a href="https://docs.atlassian.com/jira/REST/latest/" target="_blank">JIRA REST API</a>.

A non-trivial project to help me get started using Elixir - Currently WIP.


### Usage

1. Add the following to the deps section in `mix.exs`.

```elixir
defp deps do
  [
    {:oauth, github: "tim/erlang-oauth"},
    {:extwitter, "~> 0.1"}
  ]
end
```

2. Use `ExJira.configure` to setup the JIRA OAuth parameters.
3. Call the functions in the ExJira module (e.g. `ExJira.projects` to return all projects or `ExJira.project("KEY")` to return a specifc one).


### Configuration

There are three ways to configure ExJira:

#### Using config.exs

In `config/config.exs` add the following:

```elixir
config :ex_jira, [
  site: "http://youraccount.atlassian.net",
  private_key_file: "private_key.pem"   # Wherever the private key for the Application Link lives.
  consumer_key: ""                      # Whatever has been setup2 in the Application Links section in Jira.
]
```

#### Across the application at runtime

```elixir
ExTwitter.configure([consumer_key: "", ...])
```

#### For the current process at runtime

```elixir
ExTwitter.configure(:process, [consumer_key: "", ...])
```