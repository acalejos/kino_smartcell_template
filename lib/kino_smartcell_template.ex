defmodule KinoSmartcellTemplate do
  @moduledoc false

  # Your assets_path should be the same as you define in assets/vite.config.js
  use Kino.JS, assets_path: "assets/build"
  use Kino.JS.Live
  use Kino.SmartCell, name: "Kino Smart Cell Template"

  @impl true
  def init(attrs \\ %{}, ctx) do
    # attrs can be used to initialize persisted state into the context
    # This function runs once when the smart cell is loaded. If there are attrs
    # that were persisted in the Livebook they will be present here, otherwise it will start
    # with defaults you provide
    source = attrs["source"] || ""
    {:ok, assign(ctx, source: source)}
  end

  @impl true
  def handle_connect(ctx) do
    # This is run whenever a new connection is made to the smart cell, since a smart cell
    # is implemented as a GenServer.

    # It takes as a parameter the current context of the running smart cell, so if you want
    # each new connection to essentially start with a blank state you would not necessarily want to
    # pass the context into the state

    # eg. you could make this the payload
    # payload = %{
    #   fields: ctx.assigns.fields,
    #   missing_dep: ctx.assigns.missing_dep,
    #   available_plugins: ctx.assigns.available_plugins
    # }

    # or pass a blank payload, or anything in between
    {:ok, %{source: ctx.assigns.source}, ctx}
  end

  @impl true
  def to_attrs(ctx) do
    # This function takes the context of the current session and produces the attrs
    # which is a map of terms which must be serializable since they will be
    # persisted in the Livebook

    # Livebook persists these by doing a base64 and JSON encoding which will be written
    # as a comment in the .livemd file
    %{"source" => ctx.assigns.source}
  end

  @impl true
  def to_source(attrs) do
    # This function should output some quoted code that will be converted into a string
    # and will be the code that is run when the cell itself is run

    # So assuming you're deriving your output code from forms etc., it might
    # look something like this, where you generate quoted code and output the string
    # quote do
    #   IO.puts("This is a sample smart cell output")
    # end
    # |> Kino.SmartCell.quoted_to_string()

    # Since we're working with an attr that is directly source code as a string we can just pass it through here
    attrs["source"]
  end

  @impl true
  def handle_event("update", %{"source" => source}, ctx) do
    # Make as many event handlers as needed for the events you define
    broadcast_event(ctx, "update", %{"source" => source})
    {:noreply, assign(ctx, source: source)}
  end
end
