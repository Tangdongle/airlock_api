defmodule AirlockApi.AirlockData do
  @moduledoc """
  The AirlockData context.
  """

  import Ecto.Query, warn: false
  alias AirlockApi.Repo

  alias AirlockApi.AirlockData.Airlock

  @doc """
  Returns the list of airdata.

  ## Examples

      iex> list_airdata()
      [%Airlock{}, ...]

  """
  def list_airdata do
    query = from a in Airlock, order_by: [desc: a.inserted_at], select: a
    Repo.all(query)
  end

  @doc """
  Gets a single airlock.

  Raises `Ecto.NoResultsError` if the Airlock does not exist.

  ## Examples

      iex> get_airlock!(123)
      %Airlock{}

      iex> get_airlock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_airlock!(id), do: Repo.get!(Airlock, id)

  @doc """
  Creates a airlock.

  ## Examples

      iex> create_airlock(%{field: value})
      {:ok, %Airlock{}}

      iex> create_airlock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_airlock(attrs \\ %{}) do
    %Airlock{}
    |> Airlock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a airlock.

  ## Examples

      iex> update_airlock(airlock, %{field: new_value})
      {:ok, %Airlock{}}

      iex> update_airlock(airlock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_airlock(%Airlock{} = airlock, attrs) do
    airlock
    |> Airlock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a airlock.

  ## Examples

      iex> delete_airlock(airlock)
      {:ok, %Airlock{}}

      iex> delete_airlock(airlock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_airlock(%Airlock{} = airlock) do
    Repo.delete(airlock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking airlock changes.

  ## Examples

      iex> change_airlock(airlock)
      %Ecto.Changeset{data: %Airlock{}}

  """
  def change_airlock(%Airlock{} = airlock, attrs \\ %{}) do
    Airlock.changeset(airlock, attrs)
  end
end
