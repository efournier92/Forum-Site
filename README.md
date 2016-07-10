#Stack Overflow Clone Site

This repo contains a Rails app I built while studying at Launch Academy in Boston. The assignment was to build a website similar to [stackoverflow.com](http://stackoverflow.com/), for posting questions and answers.

**I did the exercise mainly to practice the following:**
* Building a Rails app from scratch
* Using Rails routes
* Using Rails form helpers
* Using Active Record associations

###Models

* Question
  * title
  * description
* Answer
  * question_id
  * description

###User Stories

```no-highlight
As a user
I want to view recently posted questions
So that I can help others
```
#####Acceptance Criteria
* User sees the title of each question
* User sees questions listed in order, most recently posted first

```no-highlight
As a user
I want to view a question's details
So that I can effectively understand the question
```
#####Acceptance Criteria
* User is able to get to this page from the questions index
* User sees the question's title
* User sees the question's description

```no-highlight
As a user
I want to post a question
So that I can receive help from others
```
#####Acceptance Criteria
* Validates title is at least 40 characters long
* Validates description is at least 150 characters long
* User sees errors if validations don't pass 

```no-highlight
As a user
I want to answer another user's question
So that I can help them solve their problem
```
#####Acceptance Criteria
* User can post an answer on a question's show page
* Validates answer description is at least 50 characters
* User sees errors if validations don't pass 

```no-highlight
As a user
I want to view the answers for a question
So that I can learn from the answer
```
#####Acceptance Criteria
* User can see other answers on question show page
* User can only see answers for that question
* Answers are listed in order, most recent first

```no-highlight
As a user
I want to edit a question
So that I can correct any mistakes or add updates
```
#####Acceptance Criteria
* User must provide valid information to edit questions
* User accesses edit page from the question's show page
* User sees errors if validations don't pass 

```no-highlight
As a user
I want to delete a question
So that I can delete duplicate questions
```
#####Acceptance Criteria
* User can delete a question from the edit page
* User can delete a question from the details page
* All answers associated with the question are also be deleted

