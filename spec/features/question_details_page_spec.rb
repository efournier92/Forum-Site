require 'rails_helper'
require 'spec_helper'

feature 'question details page' do

# USER STORIES:
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question

# ACCEPTANCE CRITERIA:
  # I must be able to get to this page from the questions index
  # I must see the question's title
  # I must see the question's description

  let!(:question) {
    Question.create(title: 'How Can I Change Versions of Rails from Terminal?',
                    description: "I've tried everything and can't get it to work.
                                  How does one go about changing rails version
                                  for the command line? I have multiple versions
                                  of Rails installed, but I can't switch between them. Help!"
                                  )
    }

  it 'is accessible by clicking the question title on index' do
    visit '/'
    click_link(question.title)

    expect(page).to have_content("Recent Answers")
  end

  it 'displays question title' do
    visit '/'
    click_link(question.title)

    expect(page).to have_content(question.title)
  end

  it 'displays question description' do
    visit '/'
    click_link(question.title)

    expect(page).to have_content(question.description)
  end

end
