defmodule ExJira.Config do
  def current_scope do
    if Process.get(:_ex_jira_oauth, nil), do: :process, else: :global
  end

  @doc """
  Get OAuth config values.
  """
  def get, do: get(current_scope)
  def get(:global), do: Application.get_env(:ex_jira, :oauth, nil)
  def get(:process), do: Process.get(:_ex_jira_oauth, nil)

  @doc """
  Set OAuth config values.
  """
  def set(value), do: set(current_scope, value)
  def set(:global, value), do: Application.put_env(:ex_jira, :oauth, value)
  def set(:process, value) do
    Process.put(:_ex_jira_oauth, value)
    :ok
  end

  @doc """
  Get OAuth configuration values in tuple format.
  """
  def get_tuples do
    case ExJira.Config.get do
      nil -> []
      tuples -> tuples |> Enum.map(fn({k, v}) -> {k, to_char_list(v)} end)
    end
  end

end