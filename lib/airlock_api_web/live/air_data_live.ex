defmodule AirlockApiWeb.AirDataLive do
  use AirlockApiWeb, :live_component
  import AirlockApi

  def update(assigns, socket) do
    {
      :ok,
      socket
      |> assign(assigns)
      |> assign_with_point_for_times()
      |> assign_dataset()
      |> assign_chart()
      |> assign_chart_svg()
      |> assign_sparkchart()
    }
  end

  defp assign_with_point_for_times(socket) do
    socket
    |> assign(:airlock_data_for_time, AirlockApi.with_point_for_times())
  end

  defp assign_dataset(%{assigns: %{airlock_data_for_time: airlock_data_for_time}} = socket) do
    socket
    |> assign(:dataset, Contex.Dataset.new(airlock_data_for_time))
  end

  defp assign_chart(%{assigns: %{dataset: dataset}} = socket) do
    socket
    |> assign(
      :chart,
      Contex.PointPlot.new(dataset)
      |> Contex.PointPlot.set_x_col_name(Contex.Dataset.column_name(dataset, 2))
      |> Contex.PointPlot.set_y_col_names([Contex.Dataset.column_name(dataset, 0), Contex.Dataset.column_name(dataset, 1)])
    )
  end

  defp assign_sparkchart(%{assigns: %{dataset: %{data: dataset}}} = socket) do
    socket
    |> assign(:spark,
      Contex.Sparkline.new(
        dataset
        |> Enum.map(&Kernel.elem(&1, 0))
      )
      |> Contex.Sparkline.draw()
    )
  end

  defp assign_chart_svg(%{assigns: %{chart: chart}} = socket) do
    socket
    |> assign(
      :chart_svg,
      Contex.Plot.new(200, 200, chart)
      |> Contex.Plot.axis_labels("Time", "BPM/Temp")
      |> Contex.Plot.to_svg()
    )
  end

end

