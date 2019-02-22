defmodule Cocktail do
  @derive [Poison.Encoder]
  defstruct [
    :accessories,
    :category,
    :description,
    :glass,
    :id,
    :ingredients,
    :imageLink,
    :name,
    :notes,
    :revisionDate
  ]
end

defmodule Ingredient do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name,
    :imageLink,
    :alcoholPercentage,
    :category,
    :notes
  ]
end

defmodule Accessory do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name,
    :description,
    :imageLink,
    :category
  ]
end

defmodule CocktailCategory do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name,
    :description,
    :imageLink
  ]
end

defmodule IngredientCategory do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name,
    :description,
    :alcoholic,
    :imageLink
  ]
end
