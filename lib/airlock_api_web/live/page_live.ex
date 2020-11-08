defmodule AirlockApiWeb.AirDataPageLive do
  use AirlockApiWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:airlock_flow_component_id, "airlock-flow")}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end
  defp search(query) do
    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end


end
