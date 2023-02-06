# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Create Seed"

Employee.destroy_all
Department.destroy_all
Feedback.destroy_all

p "Create Departments"
sales = Department.create(name: "Sales")
tech = Department.create(name: "Technologies")

p "Create Employees"
gaby = Employee.create(name: "Gabriela,", department: sales, email: "gabriela@mail.com", password:"123456")
erik = Employee.create(name: "Erik", department: tech, email: "erik@mail.com", password:"123456")
osmar = Employee.create(name: "Osrmar", department: tech, email: "osmar@mail.com", password:"123456")

p "Create Reports"

erik.reports << osmar

p "Create Feedbacks"

feed2 = Feedback.create(body: "Feed Gaby to Erik", employee: gaby, feedbackable: erik, feedbackable_type: "Employee")
feed3 = Feedback.create(body: "Feed Osmar to Erik", employee: osmar, feedbackable: erik, feedbackable_type: "Employee")
feed4 = Feedback.create(body: "Feed Gaby to Sales", employee: erik, feedbackable: sales, feedbackable_type: "Department")

p "End Seed"