defmodule OpencocktailBackend.CocktailsTest do
  use OpencocktailBackend.DataCase

  alias OpencocktailBackend.Cocktails

  describe "cocktails" do
    alias OpencocktailBackend.Cocktails.Cocktail

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def cocktail_fixture(attrs \\ %{}) do
      {:ok, cocktail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cocktails.create_cocktail()

      cocktail
    end

    test "list_cocktails/0 returns all cocktails" do
      cocktail = cocktail_fixture()
      assert Cocktails.list_cocktails() == [cocktail]
    end

    test "get_cocktail!/1 returns the cocktail with given id" do
      cocktail = cocktail_fixture()
      assert Cocktails.get_cocktail!(cocktail.id) == cocktail
    end

    test "create_cocktail/1 with valid data creates a cocktail" do
      assert {:ok, %Cocktail{} = cocktail} = Cocktails.create_cocktail(@valid_attrs)
    end

    test "create_cocktail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cocktails.create_cocktail(@invalid_attrs)
    end

    test "update_cocktail/2 with valid data updates the cocktail" do
      cocktail = cocktail_fixture()
      assert {:ok, %Cocktail{} = cocktail} = Cocktails.update_cocktail(cocktail, @update_attrs)
    end

    test "update_cocktail/2 with invalid data returns error changeset" do
      cocktail = cocktail_fixture()
      assert {:error, %Ecto.Changeset{}} = Cocktails.update_cocktail(cocktail, @invalid_attrs)
      assert cocktail == Cocktails.get_cocktail!(cocktail.id)
    end

    test "delete_cocktail/1 deletes the cocktail" do
      cocktail = cocktail_fixture()
      assert {:ok, %Cocktail{}} = Cocktails.delete_cocktail(cocktail)
      assert_raise Ecto.NoResultsError, fn -> Cocktails.get_cocktail!(cocktail.id) end
    end

    test "change_cocktail/1 returns a cocktail changeset" do
      cocktail = cocktail_fixture()
      assert %Ecto.Changeset{} = Cocktails.change_cocktail(cocktail)
    end
  end
end
