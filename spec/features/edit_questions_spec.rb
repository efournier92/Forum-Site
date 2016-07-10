require 'rails_helper'
require 'spec_helper'

feature 'edit questions' do
# USER STORIES:
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates

# ACCEPTANCE CRITERIA:
  # I must provide valid information
  # I must be presented with errors if I fill out the form incorrectly
  # I must be able to get to the edit page from the question details page

  let!(:question) {
    Question.create(title: 'How Can I Change Versions of Rails from Terminal?',
                    description: "I've tried everything and can't get it to work.
                                  How does one go about changing rails version
                                  for the command line? I have multiple versions
                                  of Rails installed, but I can't switch between them. Help!"
                                  )
    }

  it 'can be reached from question details page' do
    visit '/'

    click_link(question.title)
    click_link('Edit This Question')

    expect(page).to have_content('Edit Question')
  end

  it 'displays error if title is invalid' do
    visit '/'

    click_link(question.title)
    click_link('Edit This Question')

    fill_in('question_title', with: 'short & invalid')
    click_button('Submit Revision')
    expect(page).to have_content('Must Have 40+ Characters')
  end

  it 'displays error if description is invalid' do
    visit '/'

    click_link(question.title)
    click_link('Edit This Question')

    fill_in('question_description', with: 'short & invalid')
    click_button('Submit Revision')

    expect(page).to have_content('Must Have 150+ Characters')
  end

end
