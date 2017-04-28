# создание главных ролей
if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

#создание библиотечных залов
h1 = Hall.create(short_name: 'Первый', full_name: 'Первый зал. Малый.')
h2 = Hall.create(short_name: 'Второй', full_name: 'Второй зал. Большой.')
h3 = Hall.create(short_name: 'Третий', full_name: 'Третий зал. Большой. Есть прожектор')
h4 = Hall.create(short_name: 'Четвертый', full_name: 'Четвертый зал. Средний.')

# создание стеллажей
s11 = Shelf.create(shelf_index: 'f11', hall_id: h1.id)
s12 = Shelf.create(shelf_index: 'f12', hall_id: h1.id)
s13 = Shelf.create(shelf_index: 'f13', hall_id: h1.id)
s14 = Shelf.create(shelf_index: 'f14', hall_id: h1.id)

s21 = Shelf.create(shelf_index: 's21', hall_id: h2.id)
s22 = Shelf.create(shelf_index: 's22', hall_id: h2.id)
s23 = Shelf.create(shelf_index: 's23', hall_id: h2.id)
s24 = Shelf.create(shelf_index: 's24', hall_id: h2.id)

s31 = Shelf.create(shelf_index: 't31', hall_id: h3.id)
s32 = Shelf.create(shelf_index: 't32', hall_id: h3.id)
s33 = Shelf.create(shelf_index: 't33', hall_id: h3.id)
s34 = Shelf.create(shelf_index: 't34', hall_id: h3.id)

s41 = Shelf.create(shelf_index: 'q41', hall_id: h4.id)
s42 = Shelf.create(shelf_index: 'q42', hall_id: h4.id)
s43 = Shelf.create(shelf_index: 'q43', hall_id: h4.id)
s44 = Shelf.create(shelf_index: 'q44', hall_id: h4.id)


# создание авторов
a1 = Author.create(fn: 'Федор', ln: 'Достоевский', sn: 'Михайлович', author_idndex: 'ФДМ')
a2 = Author.create(fn: 'Альфред', ln: 'Ахо', author_idndex: 'АА4')
a3 = Author.create(fn: 'Эдвард', ln: 'Хопкрофт', author_idndex: 'АА5')
a4= Author.create(fn: 'Andrew', ln: 'Tanenbaum', author_idndex: 'GL675')

# создание книг
b11 = Book.create(name: 'Преступление и наказание', isbn: 'GN47', quantity: 20, volume: 1)
b12 = Book.create(name: 'Преступление и наказание', isbn: 'GN48', quantity: 13, volume: 2)
b13 = Book.create(name: 'Бедные люди', isbn: 'GN317', quantity: 10)
b14 = Book.create(name: 'Бесы', isbn: 'GN317', quantity: 10)

b231 = Book.create(name: 'Структуры данных и алгоритмы', isbn: '0-201-00023-7 ', quantity: 10)
b232 = Book.create(name: 'Введение в теорию автоматов, языков и вычислений', isbn: ' 0-201-44124-1', quantity: 10)

b2 = Book.create(name: 'Foundations of Computer Science', isbn: '16-321-46174-1', quantity: 1)

b41 = Book.create(name: 'Structured Computer Organizatoin', isbn: '16-497-46174-1', quantity: 12)
b42 = Book.create(name: 'Modern Operating Sustem', isbn: '36-497-41104-6', quantity: 22, volume: 1)
b43 = Book.create(name: 'Modern Operating Sustem', isbn: '46-497-41101-6', quantity: 2, volume: 2)

# создание связей книг и авторов
a1.books << b11 << b12 << b13 << b14
a2.books << b231 << b232 << b2
b3.books << b231 << b232
b4.books << b41 << b42 << b43
