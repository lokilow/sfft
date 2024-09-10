defmodule SFFT.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false

  alias SFFT.Repo
  alias SFFT.Data.{Permit, Schedule}

  @doc """
  Returns the list of permits.

  ## Examples

      iex> list_permits()
      [%Permit{}, ...]

  """
  def list_permits do
    Repo.all(Permit)
  end

  @doc """
  Gets a single permit.

  Raises `Ecto.NoResultsError` if the Permit does not exist.

  ## Examples

      iex> get_permit!(123)
      %Permit{}

      iex> get_permit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_permit!(id), do: Repo.get!(Permit, id)

  @doc """
  Creates a permit.

  ## Examples

      iex> create_permit(%{field: value})
      {:ok, %Permit{}}

      iex> create_permit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_permit(attrs \\ %{}) do
    %Permit{}
    |> Permit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of schedules.

  ## Examples

      iex> list_schedules()
      [%Schedule{}, ...]

  """
  def list_schedules do
    Repo.all(Schedule)
  end

  @doc """
  Gets a single schedules.

  Raises `Ecto.NoResultsError` if the Schedule does not exist.

  ## Examples

      iex> get_schedules!(123)
      %Schedule{}

      iex> get_schedules!(456)
      ** (Ecto.NoResultsError)

  """
  def get_schedules!(id), do: Repo.get!(Schedule, id)

  @doc """
  Creates a schedules.

  ## Examples

      iex> create_schedules(%{field: value})
      {:ok, %Schedule{}}

      iex> create_schedules(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_schedules(attrs \\ %{}) do
    %Schedule{}
    |> Schedule.changeset(attrs)
    |> Repo.insert()
  end
end
