# Seed the database with a School
School.create!(full_name: "North Central",
               screen_name: "noctrl",
               icon: "apple",
               color: "red",
               email: "noctrl@noctrl.edu",
               website: "noctrl.edu",
               description: "It's North Central!")

# Seed the database with an initial Super user
Teacher.create!(user_name: "profbill",
                password_digest: Teacher.digest("password"),
                last_login: Time.now,
                full_name: "Professor Bill",
                screen_name: "profbill",
                icon: "apple",
                color: "red",
                email: "wtktriger@noctrl.edu",
                description: "Super user",
                powers: "Admin",
                school_id: 0)

# Seed the database with 10 faked Students                
                
                
10.times do |n|
  name  = Faker::Name.name
  Student.create!(  screen_name: "temp",
                    contact_info: "student contact info",
                    description: "student description",
                    icon: "bicycle",
                    color: "green",
                    session_interval: 20,
                    school_id: 1,
                    full_name: name)
end

# Seed the database with 10 faked Squares
10.times do |n|
  name  = Faker::Name.name
  Square.create!(full_name: name,
                 screen_name: "TS#{n+1}",
                 tracking_type: n % 3, #changed from "duration" to "n%3" by Taylor S 
                                       #(I need more than just duration squares)
                 description: name,
                 color: "red",
                 school_id: 1)
end

# Assigns Students to Teacher 1
Session.create!(start_time: DateTime.new(2017,5,15,8, 30, 0),
                end_time: DateTime.new(2017,5,15,11,30, 0),
                session_teacher: 1,
                session_student: 1)


x = DateTime.new(2017,5,15,8, 30, 0)
#the time thing is awkward, but should work for now (-Taylor S.)
30.times do |n|
SessionEvent.create!(behavior_square_id: (n % 10) + 1,
                    square_press_time: x,
                    duration_end_time: x + 5.0/1440,
                    session_id:1)
x = x + 6.0/1440
end



5.times do |n|
  sid = n+1
  RosterStudent.create!(teacher_id: 1,
                        student_id: sid)
end

5.times do |n|
  bsid = n+1
  RosterSquare.create!(square_id: bsid,
                        student_id: 1)
end

# Seed the database with a Session
Session.create!(start_time: Time.now,
               end_time: Time.now + (2.0/24),
               session_teacher: 1,
               session_student: 1)
               
# Seed the database with a Session Event for the seeded Session               
SessionEvent.create!(behavior_square_id: 1,
                square_press_time: Time.now + (1.0/24),
                duration_end_time: Time.now + (1.5/24),
                session_id: 1)
                
# Seed the database with a Session Note for the seeded Session               
SessionNote.create!(note: "sample note",
                session_id: 1,)
                
#School seeds added by - Dakota B
30.times do |n|
  color = Faker::Commerce.color
  email = "example-#{n+1}@railstutorial.org"
  desc = Faker::Lorem.sentence
  pre = Faker::Address.city_suffix
  pos = Faker::Address.city_prefix
  School.create!(full_name: pre + pos + "University",
                 screen_name: "test",
                 icon: pre,
                 color: color,
                 email: email,
                 website: "www.example.edu",
                 description: desc)
end