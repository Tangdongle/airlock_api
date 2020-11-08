defmodule AirlockApi do
  @moduledoc """
  AirlockApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias AirlockApi.AirlockData
  alias AirlockApi.Repo

  def with_point_for_times do
    AirlockData.Query.with_point_for_times
    |> Repo.all()
  end

end
