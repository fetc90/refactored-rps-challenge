require 'spec_helper'

feature 'playing a game' do

  PLAY_SEED = 221563

  before do
    visit '/'
    fill_in 'name', with: 'Dave'
    click_button 'Submit'
  end

  # As a marketeer
  # So I can play a game
  # I want to see the shapes I can play

scenario 'see the shape options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  # As a marketeer
  # So I can play a game
  # I want to choose a shape to play

  scenario 'choose a shape' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock!'
  end

    # As a marketeer
    # So I can play a game
    # I want the game to choose an option

    scenario 'game chooses "Rock"'  do
      click_button 'Rock'

      message = find(:css, "#opponent").text.strip
      expect(possible_messages).to include message
    end

    scenario 'game chooses random option' do
      srand(PLAY_SEED)
      click_button 'Rock'
      expect(page).to have_content 'Opponent chose Scissors!'
    end

    def possible_messages
      [:rock, :paper, :scissors].map { |shape| "Opponent chose #{shape.to_s.capitalize}!" }
    end

end






# - the marketeer should be able to enter their name before the game
# - the marketeer will be presented the choices (rock, paper and scissors)
# - the marketeer can choose one option
# - the game will choose a random option
# - a winner will be declared
