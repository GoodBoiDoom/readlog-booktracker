import 'dart:math';

import 'home_screen.dart';

final List<Book> mockBooks = [
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    status: randomStatus(),
  ),
  Book(title: '1984', author: 'George Orwell', status: randomStatus()),
  Book(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    status: randomStatus(),
  ),
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    status: randomStatus(),
  ),
  Book(title: 'Moby-Dick', author: 'Herman Melville', status: randomStatus()),
  Book(title: 'War and Peace', author: 'Leo Tolstoy', status: randomStatus()),
  Book(
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
    status: randomStatus(),
  ),
  Book(
    title: 'The Lord of the Rings',
    author: 'J.R.R. Tolkien',
    status: randomStatus(),
  ),
  Book(title: 'Jane Eyre', author: 'Charlotte Brontë', status: randomStatus()),
  Book(
    title: 'Crime and Punishment',
    author: 'Fyodor Dostoevsky',
    status: randomStatus(),
  ),
  Book(
    title: 'Brave New World',
    author: 'Aldous Huxley',
    status: randomStatus(),
  ),
  Book(
    title: 'The Brothers Karamazov',
    author: 'Fyodor Dostoevsky',
    status: randomStatus(),
  ),
  Book(
    title: 'Wuthering Heights',
    author: 'Emily Brontë',
    status: randomStatus(),
  ),
  Book(title: 'The Odyssey', author: 'Homer', status: randomStatus()),
  Book(title: 'The Iliad', author: 'Homer', status: randomStatus()),
  Book(title: 'Les Misérables', author: 'Victor Hugo', status: randomStatus()),
  Book(title: 'Anna Karenina', author: 'Leo Tolstoy', status: randomStatus()),
  Book(
    title: 'The Divine Comedy',
    author: 'Dante Alighieri',
    status: randomStatus(),
  ),
  Book(
    title: 'Don Quixote',
    author: 'Miguel de Cervantes',
    status: randomStatus(),
  ),
  Book(title: 'Ulysses', author: 'James Joyce', status: randomStatus()),
  Book(
    title: 'Madame Bovary',
    author: 'Gustave Flaubert',
    status: randomStatus(),
  ),
  Book(
    title: 'The Sound and the Fury',
    author: 'William Faulkner',
    status: randomStatus(),
  ),
  Book(
    title: 'A Tale of Two Cities',
    author: 'Charles Dickens',
    status: randomStatus(),
  ),
  Book(
    title: 'Great Expectations',
    author: 'Charles Dickens',
    status: randomStatus(),
  ),
  Book(title: 'The Hobbit', author: 'J.R.R. Tolkien', status: randomStatus()),
  Book(title: 'Fahrenheit 451', author: 'Ray Bradbury', status: randomStatus()),
  Book(
    title: 'The Grapes of Wrath',
    author: 'John Steinbeck',
    status: randomStatus(),
  ),
  Book(title: 'East of Eden', author: 'John Steinbeck', status: randomStatus()),
  Book(
    title: 'Of Mice and Men',
    author: 'John Steinbeck',
    status: randomStatus(),
  ),
  Book(title: 'Catch-22', author: 'Joseph Heller', status: randomStatus()),
  Book(
    title: 'Slaughterhouse-Five',
    author: 'Kurt Vonnegut',
    status: randomStatus(),
  ),
  Book(title: 'Lolita', author: 'Vladimir Nabokov', status: randomStatus()),
  Book(
    title: 'The Picture of Dorian Gray',
    author: 'Oscar Wilde',
    status: randomStatus(),
  ),
  Book(title: 'Dracula', author: 'Bram Stoker', status: randomStatus()),
  Book(title: 'Frankenstein', author: 'Mary Shelley', status: randomStatus()),
  Book(
    title: 'The Count of Monte Cristo',
    author: 'Alexandre Dumas',
    status: randomStatus(),
  ),
  Book(
    title: 'The Three Musketeers',
    author: 'Alexandre Dumas',
    status: randomStatus(),
  ),
  Book(
    title: 'A Clockwork Orange',
    author: 'Anthony Burgess',
    status: randomStatus(),
  ),
  Book(title: 'The Stranger', author: 'Albert Camus', status: randomStatus()),
  Book(title: 'The Plague', author: 'Albert Camus', status: randomStatus()),
  Book(title: 'The Trial', author: 'Franz Kafka', status: randomStatus()),
  Book(
    title: 'One Hundred Years of Solitude',
    author: 'Gabriel García Márquez',
    status: randomStatus(),
  ),
  Book(
    title: 'Love in the Time of Cholera',
    author: 'Gabriel García Márquez',
    status: randomStatus(),
  ),
  Book(title: 'Beloved', author: 'Toni Morrison', status: randomStatus()),
  Book(
    title: 'Song of Solomon',
    author: 'Toni Morrison',
    status: randomStatus(),
  ),
  Book(title: 'Invisible Man', author: 'Ralph Ellison', status: randomStatus()),
  Book(title: 'Native Son', author: 'Richard Wright', status: randomStatus()),
  Book(
    title: 'Things Fall Apart',
    author: 'Chinua Achebe',
    status: randomStatus(),
  ),
  Book(
    title: 'The Color Purple',
    author: 'Alice Walker',
    status: randomStatus(),
  ),
  Book(
    title: 'The Handmaid\'s Tale',
    author: 'Margaret Atwood',
    status: randomStatus(),
  ),
  Book(
    title: 'The Blind Assassin',
    author: 'Margaret Atwood',
    status: randomStatus(),
  ),
  Book(title: 'The Bell Jar', author: 'Sylvia Plath', status: randomStatus()),
  Book(
    title: 'Mrs. Dalloway',
    author: 'Virginia Woolf',
    status: randomStatus(),
  ),
  Book(
    title: 'To the Lighthouse',
    author: 'Virginia Woolf',
    status: randomStatus(),
  ),
  Book(
    title: 'A Room of One\'s Own',
    author: 'Virginia Woolf',
    status: randomStatus(),
  ),
  Book(title: 'Middlemarch', author: 'George Eliot', status: randomStatus()),
  Book(
    title: 'The Mill on the Floss',
    author: 'George Eliot',
    status: randomStatus(),
  ),
  Book(
    title: 'David Copperfield',
    author: 'Charles Dickens',
    status: randomStatus(),
  ),
  Book(title: 'Bleak House', author: 'Charles Dickens', status: randomStatus()),
  Book(
    title: 'Oliver Twist',
    author: 'Charles Dickens',
    status: randomStatus(),
  ),
  Book(
    title: 'The Scarlet Letter',
    author: 'Nathaniel Hawthorne',
    status: randomStatus(),
  ),
  Book(
    title: 'The House of the Seven Gables',
    author: 'Nathaniel Hawthorne',
    status: randomStatus(),
  ),
  Book(
    title: 'The Sun Also Rises',
    author: 'Ernest Hemingway',
    status: randomStatus(),
  ),
  Book(
    title: 'A Farewell to Arms',
    author: 'Ernest Hemingway',
    status: randomStatus(),
  ),
  Book(
    title: 'For Whom the Bell Tolls',
    author: 'Ernest Hemingway',
    status: randomStatus(),
  ),
  Book(
    title: 'The Old Man and the Sea',
    author: 'Ernest Hemingway',
    status: randomStatus(),
  ),
  Book(
    title: 'The Metamorphosis',
    author: 'Franz Kafka',
    status: randomStatus(),
  ),
  Book(
    title: 'The Magic Mountain',
    author: 'Thomas Mann',
    status: randomStatus(),
  ),
  Book(title: 'Buddenbrooks', author: 'Thomas Mann', status: randomStatus()),
  Book(
    title: 'The Master and Margarita',
    author: 'Mikhail Bulgakov',
    status: randomStatus(),
  ),
  Book(
    title: 'Doctor Zhivago',
    author: 'Boris Pasternak',
    status: randomStatus(),
  ),
  Book(title: 'The Idiot', author: 'Fyodor Dostoevsky', status: randomStatus()),
  Book(title: 'Demons', author: 'Fyodor Dostoevsky', status: randomStatus()),
  Book(
    title: 'The Possessed',
    author: 'Fyodor Dostoevsky',
    status: randomStatus(),
  ),
  Book(
    title: 'The Unbearable Lightness of Being',
    author: 'Milan Kundera',
    status: randomStatus(),
  ),
  Book(title: 'The Book Thief', author: 'Markus Zusak', status: randomStatus()),
  Book(title: 'Life of Pi', author: 'Yann Martel', status: randomStatus()),
  Book(
    title: 'The Kite Runner',
    author: 'Khaled Hosseini',
    status: randomStatus(),
  ),
  Book(
    title: 'A Thousand Splendid Suns',
    author: 'Khaled Hosseini',
    status: randomStatus(),
  ),
  Book(title: 'The Alchemist', author: 'Paulo Coelho', status: randomStatus()),
  Book(
    title: 'The Shadow of the Wind',
    author: 'Carlos Ruiz Zafón',
    status: randomStatus(),
  ),
  Book(
    title: 'The Name of the Rose',
    author: 'Umberto Eco',
    status: randomStatus(),
  ),
  Book(
    title: 'The Pillars of the Earth',
    author: 'Ken Follett',
    status: randomStatus(),
  ),
  Book(
    title: 'The Thorn Birds',
    author: 'Colleen McCullough',
    status: randomStatus(),
  ),
  Book(title: 'Shōgun', author: 'James Clavell', status: randomStatus()),
  Book(title: 'Tai-Pan', author: 'James Clavell', status: randomStatus()),
  Book(title: 'Noble House', author: 'James Clavell', status: randomStatus()),
  Book(title: 'The Godfather', author: 'Mario Puzo', status: randomStatus()),
  Book(title: 'The Sicilian', author: 'Mario Puzo', status: randomStatus()),
  Book(
    title: 'The Bonfire of the Vanities',
    author: 'Tom Wolfe',
    status: randomStatus(),
  ),
  Book(title: 'The Right Stuff', author: 'Tom Wolfe', status: randomStatus()),
  Book(
    title: 'American Psycho',
    author: 'Bret Easton Ellis',
    status: randomStatus(),
  ),
  Book(
    title: 'Less Than Zero',
    author: 'Bret Easton Ellis',
    status: randomStatus(),
  ),
  Book(title: 'The Road', author: 'Cormac McCarthy', status: randomStatus()),
  Book(
    title: 'No Country for Old Men',
    author: 'Cormac McCarthy',
    status: randomStatus(),
  ),
  Book(
    title: 'Blood Meridian',
    author: 'Cormac McCarthy',
    status: randomStatus(),
  ),
  Book(title: 'The Stand', author: 'Stephen King', status: randomStatus()),
  Book(title: 'It', author: 'Stephen King', status: randomStatus()),
];

final _random = Random();

BookStatus randomStatus() =>
    BookStatus.values[_random.nextInt(BookStatus.values.length)];
