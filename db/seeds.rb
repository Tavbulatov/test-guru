# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Математика' },
                               { title: 'Фармакология' }])

users = User.create!([{ name: 'Алихан' },
                      { name: 'Салимхан' }])

tests = Test.create!([{ title: 'Сложение', category_id: categories[0].id, author_id: users[1].id },
                      { title: 'Вычитание', level: 1, category_id: categories[0].id, author_id: users[1].id },
                      { title: 'НПВС', category_id: categories[1].id, author_id: users[0].id },
                      { title: 'Противовирусные', level: 1, category_id: categories[1].id, author_id: users[0].id }])

questions = Question.create!([{ body: '5 + 7 =', test_id: tests[0].id },
                              { body: '10 + 8 =', test_id: tests[0].id },
                              { body: '50-6-11 =', test_id: tests[1].id },
                              { body: '78-15-13', test_id: tests[1].id },
                              { body: 'Аспирин обладает такими качествами как:', test_id: tests[2].id },
                              { body: 'Диклофенак мазь для чего ?', test_id: tests[2].id },
                              { body: 'В каком виде бывает Ацикловир ?', test_id: tests[3].id }])

answers = Answer.create!([{ body: '12', correct: true, question_id: questions[0].id },
                          { body: '11', question_id: questions[0].id },
                          { body: '9', question_id: questions[0].id },
                          { body: '13', question_id: questions[0].id },
                          { body: '18', correct: true, question_id: questions[1].id },
                          { body: '17', question_id: questions[1].id },
                          { body: '15', question_id: questions[1].id },
                          { body: '19', question_id: questions[1].id },
                          { body: '34', correct: true, question_id: questions[2].id },
                          { body: '37', question_id: questions[2].id },
                          { body: '35', question_id: questions[2].id },
                          { body: '36', question_id: questions[2].id },
                          { body: '50', correct: true, question_id: questions[3].id },
                          { body: '51', question_id: questions[3].id },
                          { body: '49', question_id: questions[3].id },
                          { body: '52', question_id: questions[3].id },
                          { body: 'Жаропонижающий,разжижает кровь,противоспалительное', correct: true,
                            question_id: questions[4].id },
                          { body: 'Ветрогонный,снижает АД', question_id: questions[4].id },
                          { body: 'Протигрибковое', question_id: questions[4].id },
                          { body: 'Отхаркивающее', question_id: questions[4].id },
                          { body: 'При травмах закрытого типа и воспалениях, устраняет болевой синдром', correct: true,
                            question_id: questions[5].id },
                          { body: 'Для обработки ран как противомикробное, регенерирующее',
                            question_id: questions[5].id },
                          { body: 'При обострениях псориаза', question_id: questions[5].id },
                          { body: 'Противогрибковое', question_id: questions[5].id },
                          { body: 'Мазь, таблетки', correct: true, question_id: questions[6].id },
                          { body: 'Сироп', question_id: questions[6].id },
                          { body: 'Гранулы', question_id: questions[6].id },
                          { body: 'Р-р для В/В', question_id: questions[6].id }])

test_passages = TestPassage.create!([{ user_id: users[0].id, test_id: tests[0].id },
                                     { user_id: users[0].id, test_id: tests[1].id },
                                     { user_id: users[1].id, test_id: tests[2].id },
                                     { user_id: users[1].id, test_id: tests[3].id }])
