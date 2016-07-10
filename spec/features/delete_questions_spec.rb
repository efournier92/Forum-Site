require 'rails_helper'
require 'spec_helper'

feature 'delete questions' do

# USER STORIES:
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions

# ACCEPTANCE CRITERIA:
  # I must be able delete a question from the question edit page
  # I must be able delete a question from the question details page
  # All answers associated with the question must also be deleted

  let!(:question) {
    Question.create(title: 'How Can I Change Versions of Rails from Terminal?',
                    description: "I've tried everything and can't get it to work.
                                  How does one go about changing rails version
                                  for the command line? I have multiple versions
                                  of Rails installed, but I can't switch between them. Help!"
                                  )
    }

    let!(:answer) {
      Answer.create(
        description: "I think it has something to do with an rvm command.
          I'll look into it and get back to ya!",
        question_id: 1
        )
      }

  it "can be reached from question edit page" do
    visit '/'

    click_link(question.title)
    click_link('Edit This Question')

    click_link('Delete Question')
    expect(page).to have_content('Questions')
  end

  it "can be reached from question details page" do
    visit '/'

    click_link(question.title)
    click_link('Delete This Question')

    expect(page).to have_content('Questions')
  end

end
