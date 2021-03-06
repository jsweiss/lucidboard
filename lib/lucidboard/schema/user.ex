defmodule Lucidboard.User do
  @moduledoc "Schema for a board record"
  use Ecto.Schema
  import Ecto.Changeset
  alias Lucidboard.UserSettings

  schema "users" do
    field(:name)
    embeds_one(:settings, UserSettings)

    timestamps()
  end

  @spec new(keyword) :: User.t()
  def new(fields \\ []) do
    defaults = [settings: UserSettings.new()]
    struct(__MODULE__, Keyword.merge(defaults, fields))
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
