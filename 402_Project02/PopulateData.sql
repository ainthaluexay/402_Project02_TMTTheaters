INSERT INTO Sales.Account(FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList)
		VALUES ('Josh', 'Atkins', 'JAT21', 'jjatkins@cougars.edu', '(123) 456-7894',
				'Godzilla King Of Monsters, Escape Room, Fractured', 'Honeydew, Justice League'),
			   ('Amee', 'Inthaluexay', 'AmeZilla', 'ainthaluexay1@cougars.edu', '(314) 276-3076',
			   'Avengers: End Game, Palmer, Wall-E', 'Raya and the Last Dragon, Every Breath You Take'),
			   ('Damian', 'Payne', 'DPN', 'dpayne@cougars.edu', '(573) 852-9412',
			   'Judas and the Black Messiah, Palmer', 'The Little Things, Palmer, Batman: Soul of the Dragon'),
			   ('Jacob', 'Meinkoth', 'JCob', 'jmeinkoth@cougars.edu', '(573) 852-0103', 'Cherry, Chaos Walking,
			   Willys Wonderland', 'Red, The Vault, Batman: Soul of the Dragon, Godzilla Vs. Kong'),
			   ('Marceline', 'Cape', 'MarDot', 'mcape@cougars.edu', '(618) 383-4991', 'Moana, Raya and the Last Dragon,
			   Captain Underpants', 'Secret Magic Control Agency, Flora and Ulysses')

SELECT * FROM Sales.Account;

INSERT INTO Theaters.Room(RoomNumber, RoomName, TotalSeat, AudioSystem)
	VALUES  (1, '3-D Room', 30, 'Dolby Atmos'),
			(2, 'Family', 40, 'Dolby Digital'),
			(3, 'Action Room', 50, 'Dolby Atmos'),
			(4, 'Curved Screen Theater', 30, 'Dolby SR'),
			(5, 'XL 3-D', 50, 'Dolby Digital EX')

SELECT * FROM Theaters.Room;

INSERT INTO Sales.Ticket (RoomId, MovieTitle, ShowTime, Seat, Price, SaleDate)
	VALUES  (3, 'Justice League', '9:00pm', '5', '$5.00', '4-11-21'),
			(2, 'Captain Underpants', '10:00am', '2', '$5.00', '4-12-21'),
			(1, 'Moana', '7:00pm', '3', '$5.00', '4-13-21'),
			(5, 'Batman: Soul of the Dragon', '11:00pm', '8', '$5.00', '4-14-21')

SELECT * FROM Sales.Ticket;


INSERT INTO Sales.Merchandise (Photo, FoodName, SouvenirName, Price)
	VALUES ('1', 'Burger', 'Hat', '$14.00'),
			('0', 'Nachos', 'Shirt', '$16.00'), 
			('1', 'Candy', 'Hat', '$18.00'),
			('0', 'Popcorn', 'Shirt', '$12.00')

SELECT * FROM Sales.Merchandise;

INSERT INTO Sales.Receipt(AccountId, TicketId, Email, Reminder)
	VALUES ('1', '2', 'jjatkins@cougars.edu', 'Email Confirmation: Your movie begins at 10:00 am!'),
			('2', '3', 'ainthaluexay1@cougars.edu', 'SMS Confirmation: Your movie begins at 7:00 pm!'),
			('3', '4', 'dpayne@cougars.edu', 'Email Confirmation: Your movie begins at 11:00 pm!'),
			('4', '1', 'jmeinkoth@cougars.edu', 'SMS Confirmation: Your movie begins at 9:00 pm.'),
			('5', '2', 'mcape@cougars.edu', 'Email Confirmation: Your movie begins at 10:00 am!')

SELECT * FROM Sales.Receipt;


INSERT INTO Theaters.Movie(RoomId, Title, ReleaseDate, AgeRating, Genre, ShowDate, ShowTime, Runtime,
	CountryOrigin, MovieLanguage, ProductionCo, Storyline, Review)
	VALUES (3, 'Godzilla King of Monsters', '03-26-2021', 'PG-13', 'Action', '03-26-2021', '11:00:00', '1 Hrs. 45 Mins.', 'Canada',
			'English', 'Vancouver Productions', '"Godzilla proves he is the king."', 'Great action film!'),
		   (2, 'Captain Underpants', '01-10-2021', 'G', 'Family', '01-10-2021', '02:00:00', '1 Hrs. 15 Mins.', 'America',
		   'English, Spanish', 'Werner Bros', 'Principal on the loose.', 'Hilarious kids movie.'),
		   (1, 'Raya and the Last Dragon', '04-01-2021', 'PG-13', 'Family', '04-02-2021', '19:30:00', '2 Hrs. 05 Mins.', 'Vietnam',
		   'Vietnamese, English', 'Banh Mi Productions', 'Raya is the ultimate fighting princess!', 'Great representation.'),
		   (4, 'Justice League', '06-29-2021', 'R', 'Action/Fighting', '06-29-2021', '22:00:00', '2 Hrs. 15 Mins.', 'Japan', 
		   'Japanese, English', 'Japan Productions', 'Your favorite DC characters save the world.', 'Wow, what a movie!'),
		   (5, 'Wall-E', '06-09-2017', 'G', 'Family', '06-09-2017', '12:00:00', '1 Hrs. 15 Mins.', 'Germany', 
		   'German, English', 'Pixar', 'The future is Wall-E.', 'Wall-E is so good!'),
		   (2, 'Flora & Ulysses', '08-29-2021', 'G', 'Comedy', '08-29-2021', '17:00:00', '1 Hrs. 03 Mins.', 'America', 
		   'English', 'DisneyPixar', 'The story of two unimaginable friends.', 'So sweet.')

SELECT* FROM Theaters.Movie;


INSERT INTO Theaters.Review(MovieId, StarRating, Comment, ReviewDate, Total)
	VALUES (1, 5, 'Lots of great action and a perfect picture!', '2021-03-28 10:54:32', 2),
		   (2, 3, 'This movie is great for kids. Boring for parents.', '2021-01-17 09:04:00', 1),
		   (3, 5, 'Best film of 2021!', '2021-04-13 12:00:32', 6),
		   (4, 1, 'Terrible, terrible movie. Marvel is better!', '2021-06-30 01:32:10', 1),
		   (5, 4, 'Okay, kind of sad. Some cute parts.', '2018-02-28 12:12:22', 5),
		   (1, 2, 'Alright kids movie.', '2021-08-30 14:30:30', 2)

SELECT * FROM Theaters.Review;

INSERT INTO Theaters.List(AccountId, MovieId, ReviewId, ShowTime, Theater)
	VALUES  (1, 1, 1, '11:00:00', 'TMT Columbia'),
			(1, 3, 3, '19:30:00', 'TMT Columbia'),
		    (2, 2, 2, '02:00:00', 'TMT Jefferson City'),
			(2, 5, 5, '12:00:00', 'TMT Columbia'),
		    (3, 1, 1, '11:00:00', 'TMT Jefferson City'),
		    (4, 1, 5, '17:00:00', 'TMT Jefferson City'),
			(4, 4, 4, '22:00:00', 'TMT Columbia'),
		    (5, 6, 2, '17:00:00', 'TMT Columbia')

SELECT * FROM Theaters.List;

INSERT INTO Theaters.MovieCrew(MovieId, CastMember, CharacterName, RoleName, DOB, HomeCity, HomeState, Country)
	VALUES (1, 'Kevin Malone', 'Godzilla', 'Lead', '1976-02-03', 'St. Louis', 'MO', 'USA'),
			(2, 'Brian Falcon', 'Principal', 'Lead', '1987-08-23', 'Sandiego', 'CA', 'USA'),
			(3, 'Xaynam Thammavongsa', 'Raya', 'Lead', '1994-10-10', 'Luang Prabang', 'NA', 'Laos'),
			(6, 'Brittany Stone', 'Flora', 'Lead', '1991-06-29', 'Minneapolis', 'MN', 'USA'),
			(6, 'Reggie Wile', 'Ulysses', 'Lead', '2002-09-01', 'Daytona Beach', 'FL', 'USA'),
			(5, 'Aaron Style', 'Wall-E ', 'Lead', '1966-01-16', 'Vancouver', 'NA', 'Canada'),
			(4, 'Val Kilmer', 'Batman', 'Lead', '1982-07-07', 'Providence', 'RI', 'USA'),
			(4, 'Calvin Klein', 'Batman', 'Backup', '1988-04-24', 'Augustus', 'ME', 'USA'),
			(1, 'Jim Halpert', 'Mecha Godzilla', 'Backup', '1976-02-03', 'St. Louis', 'MO', 'USA')

SELECT * FROM Theaters.MovieCrew;

