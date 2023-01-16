# Stepful Coaching Calendar


# README

## Setup
 - Install postgres and redis
 - Add a role for postgres named `stepful_calendar` with password `password123`
 - Clone the repo
 - In a terminal, cd to the repo
 - Run `bin/rails db:setup`
 - Run `./bin/dev`

## Scenarios

### As any User
  - Change user type:
    - Click on the button at the bottom of the page that says "Log in as Student" or "Log in as Coach"

### As a Coach
- View my schedule:
  - While viewing any page
  - Click on the link that says Schedule
- Add availabilities:
  - While viewing the calendar
  - Click on the link that says Add Availability
  - Enter the start and end times.
    - The times must be in the future
    - The duration must be 2 hours exactly
    - The availability must not overlap with existing slots
  - Click on Create Availability
  - The page will redirect to the calendar
  - The calendar will show the availability
- Write notes after a call:
  - With an availability that has an appointment with a student (see student book a slot for a call)
  - While viewing the calendar
  - Click on the pencil on pad icon under the Reservation column
  - Add a note
  - Click on Create Review (or Update Review, if existing)
  - The page will redirect to the calendar
  - Click on the pencil on pad icon under the Reservation column
  - The note has been saved and fills in the note field

- Record student satisfaction:
  - With an availability that has an appointment with a student (see student book a slot for a call)
    - While viewing the calendar
    - Click on the pencil on pad icon under the Reservation column
    - Change the rating
    - Click on Create Review (or Update Review, if existing)
    - The page will redirect to the calendar
    - Click on the pencil on pad icon under the Reservation column
    - The rating has been saved and is selected in the rating field
- Review past notes and scores:
  - Click on Schedule
  - The Note and Rating and shown for each appointment row
### As a Student
- View all appointments with all coaches:
  - Click on Schedule
  - All appointments for all coaches are shown
- Book a slot for a call
  - Click on Coaches
  - Click on a Coach name
  - Click on the calendar icon under Actions
  - The page will redirect to the Schedule
  - The appointment will appear
