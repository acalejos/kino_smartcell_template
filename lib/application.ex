defmodule KinoSmartcellTemplate.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Register all smart cells you want to expose (we only have 1 but multiple can be defined and exposed)
    Kino.SmartCell.register(KinoSmartcellTemplate)

    children = []
    opts = [strategy: :one_for_one, name: KinoSmartcellTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
