require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

feature 'playing a game' do
  before do
    visit '/'
    fill_in 'name', with: 'Dave'
    click_button 'Submit'  
  end
  # As a marketeer
  # So I can play a game
  # I want to see the shapes I can play

scenario 'see the shape options' do
    expect(page).to have_content 'Rock'
    expect(page).to have_content 'Paper'
    expect(page).to have_content 'Scissors'
  end
end


# - the marketeer should be able to enter their name before the game
# - the marketeer should be able to enter their name before the game
# - the marketeer will be presented the choices (rock, paper and scissors)
# - the marketeer can choose one option
# - the game will choose a random option
# - a winner will be declared
