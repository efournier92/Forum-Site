require 'rails_helper'
require 'spec_helper'

feature 'answer questions' do

# USER STORIES:
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem

# ACCEPTANCE CRITERIA:
  # I must be on the question detail page
  # I must provide a description that is at least 40 characters long
  # I must be presented with errors if I fill out the form incorrectly

  let!(:question) {
    Question.create(title: 'How Can I Change Versions of Rails from Terminal?',
                    description: "I've tried everything and can't get it to work.
                                  How does one go about changing rails version
                                  for the command line? I have multiple versions
                                  of Rails installed, but I can't switch between them. Help!"
                                  )
    }

  it 'rejects an answer with less than 40 characters' do
    visit '/'

    click_link(question.title)
    click_link('Answer This Question')

    fill_in('answer_description', with: 'This answer is too short.')
    click_button('Submit Answer')

    expect(page).to have_content('Description is too short')
  end

  it 'accepts an answer with more than 40 characters' do
    visit '/'

    click_link(question.title)
    click_link('Answer This Question')

    fill_in('answer_description', with: 'This answer should be long enough for RSpec test to accept it!!!')
    click_button('Submit Answer')

    expect(page).to have_content('Answer Submitted!')
  end

end
