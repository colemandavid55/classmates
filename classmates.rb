# require 'pg'
# db = PG.CONNECT (host: 'localhost', dbname: '<database name>')
# result = db.exec("select name, score from inspecitions where score < 70")
# result.etries.count
# result.entires.first

require 'pg'

db = PG.connect(host: 'localhost', dbname: 'classmates_db')
result = db.exec("select * from classmates;")
# puts "#{result.entries.first}"


def insert_user_input(db)
  puts "What is your first name?"
  first = gets.chomp
  puts "What is your last name?"
  last = gets.chomp
  puts "What is your twitter handle?"
  twit = gets.chomp
  db.exec("INSERT INTO classmates (first_name, last_name, twitter) 
    VALUES ('#{first}', '#{last}', '#{twit}');")
  # result = db.exec("SELECT * FROM classmates;")
  # puts "#{result.entries}"
end


def view_all_records(db)
  result = db.exec("SELECT * FROM classmates;")
  puts "#{result.entries}"
end



def delete_a_record(db)
  puts "What is the twitter handle of the record you wish to delete?"
  twit = gets.chomp
  db.exec("DELETE FROM classmates WHERE twitter = '#{twit}';")
end

def update_a_record(db)
  puts "What is the twitter handle of the record you wish to update?"
  twit = gets.chomp
  puts "What about this record do you wish to update? (first, last, twitter)"
  answer = gets.chomp
  case answer
  when "first"
    puts "What should the first name be?"
    first_answer = gets.chomp
    db.exec("UPDATE classmates SET first_name = '#{first_answer}' WHERE twitter = '#{twit}';")
  when "last"
    puts "What should the last name be?"
    last_answer = gets.chomp
    db.exec("UPDATE classmates SET last_name = '#{last_answer}' WHERE twitter = '#{twit}';")
  when "twitter"
    puts "What should the twitter handle be?"
    twitter_answer = gets.chomp
    db.exec("UPDATE classmates SET twitter = '#{twitter_answer}' WHERE twitter = '#{twit}';")
  else
    puts "Invalid Response!"
  end
end

view_all_records(db)

insert_user_input(db)

view_all_records(db)

delete_a_record(db)

view_all_records(db)

update_a_record(db)

