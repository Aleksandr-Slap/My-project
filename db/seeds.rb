Answer.destroy_all
Question.destroy_all
User.destroy_all


users = User.create ([
                     {email: 'sasha@mail.ru', password: 123456, password_confirmation: 123456 },
                     {email: 'luba@mail.ru', password: 123456, password_confirmation: 123456 }
                     ])

p "Created #{User.count} users"


questions = Question.create([
                             {title: 'Про Руби', body: "Кто создал Ruby?", user_id: users[0].id},
                             {title: 'Про переменную', body: "Значение переменной Ruby по умолчанию?", user_id: users[0].id},
                             {title: 'Про метод', body: "Что вернёт метод .upcase?", user_id: users[1].id},
                             {title: 'Про тесты', body: "Что такое unit tests?", user_id: users[1].id}
                             ])

p "Created #{Question.count} questions"
                             

Answer.create([
               {body: "Jo Rogan", question_id: questions[0].id, user_id: users[1].id},
               {body: "Matz", question_id: questions[0].id, user_id: users[1].id},
               {body: "Nil", question_id: questions[1].id, user_id: users[1].id},
               {body: "Null", question_id: questions[1].id, user_id: users[1].id},
               {body: "Незнаю", question_id: questions[3].id, user_id: users[0].id},
               {body: "Что то этакое", question_id: questions[3].id, user_id: users[0].id},
               {body: "Table", question_id: questions[2].id, user_id: users[0].id},
               {body: "TABLE", question_id: questions[2].id, user_id: users[0].id}
               ])

p "Created #{Answer.count} answers"
