require 'rails_helper'
require 'spec_helper'

feature 'post question page' do

# USER STORIES:
  # As a user
  # I want to post a question
  # So that I can receive help from others

# ACCEPTANCE CRITERIA:
  # I must provide a title that is at least 40 characters long
  # I must provide a description that is at least 150 characters long
  # I must be presented with errors if I fill out the form incorrectly

  let(:valid_description) do
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
    ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis
    parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec,
    pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.'
  end

  let(:valid_title) do
    'This answer should be long enough for RSpec test to accept it!!!'
  end

  it 'rejects a title with less than 40 characters' do
    visit '/questions/new'

    fill_in('question_title', with: 'This title is too short.')
    fill_in('question_description', with: valid_description)
    click_button('Submit Question')

    expect(page).to have_content('Must Have 40+ Characters!')
  end

  it 'accepts a title with more than 40 characters' do
    visit '/questions/new'

    fill_in('question_title', with: valid_title)
    fill_in('question_description', with: valid_description)
    click_button('Submit Question')

    expect(page).to have_content('Question Created!')

  end

  it 'rejects a description with less than 150 characters' do
    visit '/questions/new'

    fill_in('question_title', with: valid_title)
    fill_in('question_description', with: 'This description is too short')
    click_button('Submit Question')

    expect(page).to have_content('Must Have 150+ Characters')
  end

  it 'accepts a description with more than 150 characters' do
    visit '/questions/new'

    fill_in('question_title', with: valid_title)
    fill_in('question_description', with: valid_description)
    click_button('Submit Question')

    expect(page).to have_content('Question Created!')
  end

end
