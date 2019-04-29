defmodule KV do
  use Application

  def start(_type, _args) do
    children=[
      {Counter, 0},
      Supervisor.child_spec({Stack, [:hello]}, id: Stack1, shutdown: 10_000),
      Supervisor.child_spec({Stack, [:hello]}, id: Stack2, shutdown: 10_000)
    ]
    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end
