# ExJira

A JIRA client library for Elixir using <a href="https://github.com/tim/erlang-oauth/" target="_blank">erlang-oauth</a> to call the <a href="https://docs.atlassian.com/jira/REST/latest/" target="_blank">JIRA REST API</a>.

A non-trivial project to help me get started using Elixir - Currently WIP.


### Usage

#### 1. Add dependencies

Add the following to the deps section in `mix.exs`.

```elixir
defp deps do
  [
    {:oauth, github: "tim/erlang-oauth"},
    {:extwitter, "~> 0.1"}
  ]
end
```

#### 2. Setup OAuth parameters

Use `ExJira.configure` to setup the JIRA OAuth parameters. See the Configuration section below for further details.

#### 3. Access JIRA endpoints

Call the functions in the ExJira module (e.g. `ExJira.projects` to return all projects or `ExJira.project("KEY")` to return a specifc one).


### Configuration

There are three ways to configure ExJira:

#### Using config.exs

In `config/config.exs` add the following:

```elixir
config :ex_jira, [
  site: "http://youraccount.atlassian.net",
  private_key_file: "private_key.pem"
  consumer_key: ""
]
```

#### Across the application at runtime

```elixir
ExJira.configure([consumer_key: "", ...])
```

#### For the current process at runtime

```elixir
ExJira.configure(:process, [consumer_key: "", ...])
```