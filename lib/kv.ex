defmodule KV do
  use Application

  def start(_type, _args) do
    children=[
      {Counter, 0},
      Supervisor.child_spec({Stack, [:hello]}, shutdown: 10_000),
      {Mongo, [name: :mongo, database: "lpe-development", pool: DBConnection.Poolboy]}
    ]
    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end
