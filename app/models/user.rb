class User < ApplicationRecord
  require 'faker'

  has_many :section_instructors_as_instructor, class_name: "SectionInstructor", foreign_key: "instructor_id"
  has_many :section_instructors_as_teaching_assistant, class_name: "SectionInstructor", foreign_key: "teaching_assistant_id"
  has_many :student_applications
  has_many :evaluations, class_name: "Evaluation", foreign_key: "instructor_id"
  has_many :evaluations, class_name: "Evaluation", foreign_key: "grader_id"

  # User can now be approved
  def approve
    update(is_approved: true)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w-]+(\.[\w-]+)*@osu\.edu\z/, message: "must be a valid OSU email address" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  # validates_presence_of :password_confirmation
  # validates_confirmation_of :password
=begin
puts "Admin emails"
  2.times do
    user = User.create(
      email: Faker::Internet.email(domain:'osu.edu'),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: 'password',
      role: 'Admin',
      is_approved: Faker::Boolean.boolean


    )
    puts user.email
  end


  puts "Instructor emails"
  2.times do
    user = User.create(
      email: Faker::Internet.email(domain:'osu.edu'),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: 'password',
      role: 'Instructor',
      is_approved: Faker::Boolean.boolean


    )
    puts user.email
  end


  puts "Student emails"
  2.times do
    user = User.create(
      email: Faker::Internet.email(domain:'osu.edu'),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: 'password',
      role: 'Student',
      is_approved: Faker::Boolean.boolean


    )
    puts user.email
  end

=end

end
