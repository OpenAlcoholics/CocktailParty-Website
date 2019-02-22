defmodule OpencocktailBackendWeb.DrinkEditView do
  use OpencocktailBackendWeb, :view

  def cocktail(id) do
    HTTPoison.start
    # use Cockapi, :get_cocktails
    import Cockapi,
           only: [get_cocktail: 1, get_ingredient: 1]
    cocktail = get_cocktail(id)

    ingredients = Enum.map(
      cocktail.ingredients,
      fn ingredients_rank ->
        Enum.map(
          ingredients_rank,
          fn ingredient ->
            api_ingredient = get_ingredient(Map.get(ingredient, "ingredientId"))
            Map.put(api_ingredient, :share, Map.get(ingredient, "share"))
          end
        )
        |> List.flatten
      end
      |> List.flatten
    )

    # TODO: Convert submap keys away from string
    cocktail =
      cocktail
      |> Map.replace!(
           :ingredients,
           ingredients
         )

    cocktail
    # Map.replace!(cocktail, :accessories, get_accessories(cocktail)): /accessory is not implemented in the backend
  end
end
