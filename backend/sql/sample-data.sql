-- Insert into Users (2 users: regular and admin)
INSERT INTO Users (Username, Email, PasswordHash, Role)
VALUES 
  ('testuser', 'test@example.com', 'hashedpassword123', 'User'),
  ('admin1', 'admin@example.com', 'hashedpassword456', 'Admin');

-- Insert into Books (5 books with moods, pace, mock API data)
INSERT INTO Books (Title, Author, Type, Mood, Pace, ISBN, Summary, CoverURL, AddedByUserID)
VALUES 
  ('1984', 'George Orwell', 'Fiction', 'Dark,Dystopian', 'Fast', '9780451524935', 'A dystopian novel about totalitarianism.', 'https://books.google.com/cover/1984.jpg', 1),
  ('Sapiens', 'Yuval Noah Harari', 'Non-Fiction', 'Informative,Thought-provoking', 'Medium', '9780062316097', 'A brief history of humankind.', 'https://books.google.com/cover/sapiens.jpg', 1),
  ('Pride and Prejudice', 'Jane Austen', 'Fiction', 'Romantic,Funny', 'Medium', '9780141439518', 'A classic romance novel.', 'https://books.google.com/cover/pride.jpg', 2),
  ('The Hobbit', 'J.R.R. Tolkien', 'Fiction', 'Adventurous,Fantastical', 'Fast', '9780547928227', 'A fantasy adventure.', 'https://books.google.com/cover/hobbit.jpg', 1),
  ('Atomic Habits', 'James Clear', 'Non-Fiction', 'Motivational,Practical', 'Slow', '9780735211292', 'Building good habits.', 'https://books.google.com/cover/atomic.jpg', 2);

-- Insert into UserBooks (3 mappings: testuser's books with status/progress)
INSERT INTO UserBooks (UserID, BookID, ReadingStatus, Progress, Owned, DNF)
VALUES 
  (1, 1, 'Reading', 50, TRUE, FALSE),  -- testuser reading 1984
  (1, 2, 'Read', 100, TRUE, FALSE),     -- testuser read Sapiens
  (2, 3, 'To Read', 0, FALSE, FALSE);   -- admin1 to read Pride and Prejudice

-- Insert into Favorites (2 favorites)
INSERT INTO Favorites (UserID, BookID)
VALUES 
  (1, 1),  -- testuser favorites 1984
  (1, 4);  -- testuser favorites The Hobbit

-- Insert into Reminders (2 reminders)
INSERT INTO Reminders (UserID, BookID, ReminderDate, ReminderNote)
VALUES 
  (1, 1, '2025-10-01 00:00:00', 'Finish 1984 by October'),
  (1, 2, '2025-11-15 00:00:00', 'Re-read Sapiens');

-- Insert into Reviews (2 reviews with half-star ratings)
INSERT INTO Reviews (UserID, BookID, ReviewText, Rating)
VALUES 
  (1, 1, 'A chilling read about surveillance.', 4.5),
  (2, 3, 'Timeless romance.', 5.0);

-- Insert into Comments (2 comments with progress for spoiler control)
INSERT INTO Comments (ReviewID, UserID, CommentText, ProgressPercent)
VALUES 
  (1, 2, 'I agree, the ending was surprising!', 80),  -- Comment on 1984 review at 80% progress
  (2, 1, 'Love the characters.', 10);                -- Comment on Pride review at 10% progress

-- Insert into Tags (3 custom tags)
INSERT INTO Tags (TagName)
VALUES 
  ('Summer Reads'),
  ('Dystopian'),
  ('Self-Help');

-- Insert into BookTags (3 mappings)
INSERT INTO BookTags (BookID, TagID)
VALUES 
  (1, 2),  -- 1984 tagged 'Dystopian'
  (2, 3),  -- Sapiens tagged 'Self-Help'
  (4, 1);  -- The Hobbit tagged 'Summer Reads'