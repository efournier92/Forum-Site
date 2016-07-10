require 'rails_helper'
require 'spec_helper'

feature 'questions index' do

# USER STORIES:
  # As a user
  # I want to view recently posted questions
  # So that I can help others

# ACCEPTANCE CRITERIA:
  # I must see the title of each question
  # I must see questions listed in order, most recently posted first

  let!(:question_01) {
    Question.create(title: 'How Can I Change Versions of Rails from Terminal?',
                    description: "I've tried everything and can't get it to work.
                                  How does one go about changing rails version
                                  for the command line? I have multiple versions
                                  of Rails installed, but I can't switch between them. Help!"
                                  )
    }

  let!(:question_02) {
    Question.create(title: 'What the capital of Wyoming? I have no idea what it is!',
                    description: "I know I should have Googled this, but I'm
                                  not really sure how to use Google. This is the
                                  only website I know how to use, which is very inconvinient.
                                  Please, someone tell me what the hell the capital is!"
                                )
    }

  it 'lists title of each question' do
    visit '/'

    expect(page).to have_content(question_01.title)
    expect(page).to have_content(question_02.title)
  end

  it 'lists questions in order of creation, most recent first' do
    visit '/'

    first_position = page.body.index(question_02.title)
    last_position  = page.body.index(question_01.title)

    expect(first_position).to be > last_position
  end

  it 'contains link to create new question' do
    visit '/'

    click_link('Ask a Question')
  end

end
