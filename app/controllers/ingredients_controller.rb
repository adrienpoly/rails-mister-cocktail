class IngredientsController < ApplicationController
  autocomplete :ingredient, :name, full: true
end
