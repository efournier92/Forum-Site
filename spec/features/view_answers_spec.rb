require 'rails_helper'
require 'spec_helper'

feature 'view answers' do

# USER STORIES:
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer

# ACCEPTANCE CRITERIA:
  # I must be on the question detail page
  # I must only see answers to the question I'm viewing
  # I must see all answers listed in order, most recent last

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

  let!(:answer_01) {
    Answer.create(
      description: "I think it has something to do with an rvm command.
        I'll look into it and get back to ya!",
      question_id: question_01.id
      )
    }

  let!(:answer_02) {
    Answer.create(
      description: "You should be ashamed of yourself. The Internet's not that
        hard to use. Find the answer yourself!",
      question_id: question_02.id
      )
    }

  let!(:answer_03) {
  Answer.create(
      description: "It's Cheyenne. You get this one for free,
        but next time make more of an effort before asking!",
      question_id: question_02.id
      )
    }

  scenario "displays only answers to the question I'm viewing" do
    visit '/'
    click_link(question_02.title)
    expect(page).to have_content(answer_02.description)
    expect(page).to_not have_content(answer_01.description)
  end

  scenario "orders answers with the most recent last" do
    visit '/'

    click_link(question_02.title)

    # first_position = page.body.index(answer_02.description)
    # last_position  = page.body.index(answer_03.description)

    expect('You should be ashamed of yourself.').to be > "It's Cheyenne."
  end

end
