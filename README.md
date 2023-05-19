# Welcome to Grader Management!

This application is intended to centralize and make efficient the process of browsing Computer Science and Engineering Courses at The Ohio State University. The ultimate goal of this application is to allow graders to be seamlessly matched to courses in need of undergraduate TA's. This current iteration supports Administrator, Instructor, and Student roles and allows for browsing, filtering, and certain administrator privileges which will be expanded upon below. The course information displayed is accurate and timely information pulled from [OSU's class search](https://classes.osu.edu/class-search/#/?q=&client=class-search-ui&p=1&class-attribute=ge2&subject=cse&term=1232&campus=col&academic-career=ugrd#top-nav).

Before detailing the installation of this application, the constraints will be discussed.

## Constraints
Since the course information available was extensive, the scope of this application was narrowed. Specifically:

1. The courses listed are only Computer Science and Engineering undergraduate classes.

2. All courses are attributed to OSU's Columbus campus.

3. All course information is for the Spring 2023 semester.

On to the installation.

## Installation

### Dependencies
- Command Line
  - Terminal can be used for MacOS and Linux.
  - For Windows, Ubuntu is recommended. Install [Ubuntu using WSL](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#2-install-wsl).
- Ruby 3.2.0
  - To install, follow [Ruby's documentation for your environment](https://www.ruby-lang.org/en/documentation/installation/).
- Rails
  - Rails should automatically be installed from the Gemfile.
### Steps
1. First, clone the github repository. That can be done by running the command below in your terminal
   ```
   git clone <repository-url>
   ```
   The URL to clone the repository can be found by clicking the green "Code" button visible from the repository.
   
2. Install bundler. This will allow you to manage Ruby gems and dependencies.
   ```
   gem install bundler
   ```
3. Navigate to root directory of cloned repository and install necessary gems.
   ```
   cd <repository-directory>
   bundle install
   ```
4. Set up the database and seed necessary information.
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```
5. Start the server
   ```
   rails server
   ```
6. Navigate to local host at this [link](http://localhost:3000).

## Functionality

The application opens to the home page, which allows users to sign in, sign up, or view the course catalog as a guest. There are three possible roles and respective functionality in our application. All users, after they are signed up and logged in, can change their password or cancel their account from the profile icon in the navigation bar.

### Administrators

After the installation instructions have been completed and the server is started, a default administrator will have been created. This is necessary since all other adminstrators and instructors must be approved by an existing administrator. The login information for the default administrator is as follows:
 - Username: admin.1@osu.edu
 - Password: "notpassword"

All other administrators have to sign up with their first name, last name, email and password. After sign up, they can login with their email and password. They must also specify "Admin" as their role. **Only @osu.edu emails are accepted.** After logging in, administrators can see all the courses listed and their relevant sections. They can also filter courses by level and search for courses by their name and number. An approved administrator can navigate to the "Approve" page and approve pending instructors and admins if they deem fit. If a user is disapproved, they are deleted. Approved administrators can add a course, update an existing course, or delete a course. They can also add a section to a course, edit an existing section of a course, and delete a section of a course. They can also reload the database from the "Reload" button in the navigation bar.

### Instructors 

Instructors sign up just like admins but specify "Instructor" as their role. They can login with their email and password after sign up. Once again, **only @osu.edu emails are accepted.** They must be approved by an existing administrator. If they are disapproved, they are deleted. They are able to view courses and sections as well as filter and search for courses.

### Students

Students sign up like instructors and admins but specify "Student" as their role. They can login with their email and password after sign up. Once again, **only @osu.edu emails are accepted.** They currently have the same functionality as instructors, which is viewing courses and sections and filtering them as they would like.

### Guest
If someone would just like to view the courses and their relevant sections as well as filter and search, they can navigate to the course catalog by clicking on "Guest" from the home page.
## Logical Walkthrough
Here is a logical walkthrough of a prospective administrator which would display all the features of our application.
  1. Administrator navigate to home page and signs up with their first name, last name, @osu.edu email, and a chosen password. They specify their role as "Admin."
  2. After the administrator signs up, they will be guided to the course catalog. They can view course information and section information tied to the course. They can      also filter by courses by course level and search for courses by number and name.
  3. Eventually, someone with the default administrator login details will approve this administrator.
  4. After the administrator is approved, their course catalog navigation bar will allow them to navigate to approve other administrators and reload the database.
  5. They will also have the ability to create, update, and delete courses and sections.
  6. This administrator can delete and update a couple of courses, the course catalog will be updated accordingly.
  7. The administrator then signs out.

## Troubleshooting

Since a lot of data is being processed to create the catalog view, sometimes when an administrator clicks "Reload," the application times out. A stable fix to this has been **refreshing the page and clicking reload again.**
