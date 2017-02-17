# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

base_url = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?"

# cocktails = JSON.load(open(base_url + "c=Cocktail"))['drinks'].first(10)

def create_new_cocktail(cocktail_h)
  new_cocktail = {
    name:       cocktail_h['strDrink'],
    category:  cocktail_h['strAlcoholic'],
    alcoholic:  cocktail_h['strAlcoholic'] == 'Alcoholic',
    glass_type: cocktail_h['strGlass'],
    image_url:  cocktail_h['strDrinkThumb'],
    instructions: cocktail_h['strInstructions']
  }
  Cocktail.create(new_cocktail)
end

def scrap_cocktail_detail(cocktails)
  cocktails.each do |cocktail|
    cocktail_h = JSON.load(open(base_url + 'i=' + cocktail["idDrink"]))['drinks'].first
  create_new_cocktail(cocktail_h)
end

def scrap_ingredients
  ingredients = JSON.load(open(base_url + "i=list"))['drinks']

  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient['strIngredient1'])
  end
end

scrap_ingredients
scrap_cocktail_detail(JSON.load(open(base_url + "c=Cocktail"))['drinks'].first(10))
scrap_cocktail_detail(JSON.load(open(base_url + "c=Ordinary_Drink"))['drinks'].first(10))



# cocktail = JSON.load(open(base_url+cocktails.first["idDrink"]))['drinks'].first
# 14272

# [{"strDrink"=>"'57 Chevy with a White License Plate", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/qyyvtu1468878544.jpg", "idDrink"=>"14029"},
#  {"strDrink"=>"155 Belmont", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg", "idDrink"=>"15346"},
#  {"strDrink"=>"9 1/2 Weeks", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/xvwusr1472669302.jpg", "idDrink"=>"16108"},
#  {"strDrink"=>"A Gilligan's Island", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/wysqut1461867176.jpg", "idDrink"=>"16943"},
#  {"strDrink"=>"A True Amaretto Sour", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/rptuxy1472669372.jpg", "idDrink"=>"17005"},
#  {"strDrink"=>"A.D.M. (After Dinner Mint)", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/ruxuvp1472669600.jpg", "idDrink"=>"14560"},
#  {"strDrink"=>"Absolut Summertime", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/trpxxs1472669662.jpg", "idDrink"=>"14107"},
#  {"strDrink"=>"Absolutly Screwed Up", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/yvxrwv1472669728.jpg", "idDrink"=>"16134"},
#  {"strDrink"=>"Addison Special", "strDrinkThumb"=>nil, "idDrink"=>"14272"},
#  {"strDrink"=>"Afterglow", "strDrinkThumb"=>"http://www.thecocktaildb.com/images/media/drink/vuquyv1468876052.jpg", "idDrink"=>"12560"}]


# cocktails
# image_url
# alcoholic
# glass_type
# instructions

# {
# "idDrink": "14272",
# "strDrink": "Addison Special",
# "strCategory": "Cocktail",
# "strAlcoholic": "Alcoholic",
# "strGlass": "Old-fashioned glass",
# "strInstructions": "Combine ingredients in the order listed into a shaker. Fill half full with ice and shake well. Strain into glass with ice and garnish with a cherry and orange wedge.",
# "strDrinkThumb": null,
# "strIngredient1": "Vodka",
# "strIngredient2": "Grenadine",
# "strIngredient3": "Orange juice",
# "strIngredient4": "",
# "strIngredient5": "",
# "strIngredient6": "",
# "strIngredient7": "",
# "strIngredient8": "",
# "strIngredient9": "",
# "strIngredient10": "",
# "strIngredient11": "",
# "strIngredient12": "",
# "strIngredient13": "",
# "strIngredient14": "",
# "strIngredient15": "",
# "strMeasure1": "1 shot ",
# "strMeasure2": "1 tblsp ",
# "strMeasure3": "Fill with ",
# "strMeasure4": " ",
# "strMeasure5": " ",
# "strMeasure6": " ",
