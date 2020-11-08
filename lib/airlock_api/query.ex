defmodule AirlockApi.AirlockData.Query do
  alias AirlockApi.AirlockData.Airlock
  import Ecto.Query

  def base do
    Airlock
  end

  def with_point_for_times(query \\ base()) do
    query
    |> point_for_times()
  end

  defp point_for_times(query) do
    query = from q in query,
      order_by: [desc: q.inserted_at],
      select: {q.bpm, q.temp, q.inserted_at}
  end
end
