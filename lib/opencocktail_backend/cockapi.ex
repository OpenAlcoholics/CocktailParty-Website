defmodule Cockapi do
  def get(url, headers, destructuring) do
    {:ok, model} =
      case HTTPoison.get(url, headers ++ get_authentication_header(), []) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          body
        {:ok, %HTTPoison.Response{status_code: 401}} ->
          raise "Unauthorized"
        {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
          raise "Unknown error while connecting to #{url} [#{status_code}]\n#{body}}"
        {:error, %HTTPoison.Error{reason: reason}} ->
          raise reason
      end
      |> Poison.decode(as: destructuring)

    model
  end

  def get_cocktailcategory(id) do
    url = "https://api.opencocktail.party/cocktail/category/#{id}}"

    get(url, [], %CocktailCategory {})
  end

  def get_cocktailcategories do
    url = "https://api.opencocktail.party/cocktail/category?q=Highballs"

    get(url, [], [%CocktailCategory {}])
  end

  def ingredienntcategory(id) do
    url = "https://api.opencocktail.party/ingredient/category/#{id}}"

    get(url, [], %IngredientCategory {})
  end

  def get_ingredientcategories do
    url = "https://api.opencocktail.party/ingredient/category"

    get(url, [], [%IngredientCategory {}])
  end

  def get_authentication_header do
    token = ""
    ["Authorization": "Bearer " <> token]
  end

  def get_cocktail(id) do
    url = "https://api.opencocktail.party/cocktail/#{id}"

    get(url, [], %Cocktail {})
  end

  def get_accessory(id) when is_integer(id) do
    url = "https://api.opencocktail.party/accessory/#{id}"

    get(url, [], %Accessory {})
  end

  def get_accessories(cocktail) do
    cocktail.accessories
    |> Enum.map(
         fn accessory ->
           get_accessory(Map.get(accessory, "accessoryId"))
         end
       )
  end

  def get_ingredient(id) when (is_integer(id)) do
    url = "https://api.opencocktail.party/ingredient/#{id}"

    get(url, [], %Ingredient {})
  end

  def get_ingredients(cocktail) do
    cocktail.ingredients
    |> Enum.map(
         fn ingredients_rank ->
           Enum.map(
             ingredients_rank,
             fn ingredient ->
               get_ingredient(Map.get(ingredient, "ingredientId"))
             end
           )
         end
       )
  end

  def get_cocktails do
    url = "https://api.opencocktail.party/cocktail"

    get(url, [], [%Cocktail {}])
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
