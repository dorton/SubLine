# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    grades = Grade.create([{ name: 'PreK'}, { name: 'Kinder'}, { name: '1st'}, { name: '2nd'}, { name: '3rd'},
                           { name: '4th'}, { name: '5th'}, { name: '6th'}, { name: '7th'}, { name: '8th'}, { name: 'Multi Grade'}])


    subjects = Subject.create([{ name: 'Math'}, {name: 'Reading'}, { name: 'Social Studies'}, {name: 'Science'}, {name: 'PE'}, {name: 'Music'},
                                {name: 'Computer'}, {name: 'Language Arts'}, {name: 'History'}, {name: 'Algebra' }])


    def create_user
      user = User.new
      user.first_name = "Brian"
      user.last_name = "Dorton"
      user.email = "brian.dorton@theironyard.com"
      user.password = '12345678'
      user.super_admin = true
      user.save!
      user
    end

    create_user

    def create_school
      school = School.new
      school.name = Faker::Company.name
      school.address = Faker::Address.street_address
      school.city = Faker::Address.city
      school.state = Faker::Address.state
      school.zip = Faker::Address.zip_code
      school.phone = Faker::PhoneNumber.phone_number
      school.save!
      school
    end

    5.times do
      create_school
    end

    def create_teacher(school)
      teacher = User.new
      teacher.first_name = Faker::Name.first_name
      teacher.last_name = Faker::Name.last_name
      teacher.email = Faker::Internet.email
      teacher.password = Faker::Internet.password(8)
      teacher.schools << school
      teacher.subjects << Subject.all.sample(1 + rand(Subject.all.count))
      teacher.grades << Grade.all.sample
      teacher.teacher = true
      teacher.save!
      teacher
    end

    50.times do
      create_teacher(School.all.sample)
    end

    def create_sub(school)
      subst = User.new
      subst.first_name = Faker::Name.first_name
      subst.last_name = Faker::Name.last_name
      subst.email = Faker::Internet.email
      subst.password = Faker::Internet.password(8)
      subst.schools << school
      subst.subjects << Subject.all.sample(1 + rand(Subject.all.count))
      subst.grades << Grade.all.sample(1 + rand(Grade.all.count))
      subst.substitute = true
      subst.save!
      subst
    end

    10.times do
      create_sub(School.all.sample(1 + rand(School.all.count)))
    end
