--6 a. modify user review
--TEST PUSH FOR NEW REPO 01
GO
CREATE OR ALTER PROCEDURE Theaters.UpdateReview
	@ListId INT,
	@MovieId INT,
	@StarRating INT,
	@Comment NVARCHAR(1000),
	@ReviewDate DATETIME2,
	@Total INT
AS
SET NOCOUNT ON;
DECLARE @NumCommentFound INT;
	SELECT @NumCommentFound = COUNT(*)
	FROM Theaters.Review
	WHERE ListId = @ListId
		IF (@NumCommentFound = 1)
	UPDATE Theaters.Review
		SET ListId = @ListId, 
			MovieId =  @MovieId, 
			StarRating = @StarRating, 
			Comment = @Comment, 
			ReviewDate = @ReviewDate, 
			Total = @Total
	WHERE ListId = @ListId
		AND MovieId = @MovieId
GO

EXECUTE Theaters.UpdateReview
	@ListId = 2,
	@MovieId = 3,
	@StarRating = 5,
	@Comment = 'This was a great movie with great representation!',
	@ReviewDate = '2021-04-15 13:30:00',
	@Total = 3;

SELECT * FROM Theaters.Review;


--b Display all movies from a customer's watch list
;

WITH AccountWatchList (FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList) AS
(
	SELECT FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList
	FROM Sales.Account
	WHERE AccountId = 5
)

SELECT NickName, WatchList 
FROM AccountWatchList

--c display all movies a customer has already viewed
go
WITH AccountViewedMovies (FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList) AS
(
	SELECT FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList
	FROM Sales.Account
	WHERE AccountId = 2
)

SELECT NickName, ViewedMovie 
FROM AccountViewedMovies;

--d display a movie's average customer rating

SELECT M.Title, AVG(StarRating) AS 'Average Customer Rating'
FROM Theaters.Movie AS M JOIN Theaters.Review AS R
ON M.MovieId = R.MovieId
WHERE M.MovieId = 4
GROUP BY M.Title;

SELECT * FROM Theaters.Movie;
SELECT * FROM Theaters.Review;


--e display all reviews of a movie

SELECT M.Title, R.Comment
FROM Theaters.Movie AS M JOIN Theaters.Review  AS R
ON M.MovieId = R.MovieId
WHERE R.MovieId = 1;

--f display all movies by cast and crew

SELECT MC.CastMember, MC.CharacterName, M.Title
FROM Theaters.MovieCrew AS MC JOIN Theaters.Movie AS M
ON MC.MovieId = M.MovieId
WHERE MC.MovieId = 1;

--g display all reviews by a customer

SELECT Comment
FROM Theaters.Review AS R JOIN Theaters.List AS L
ON R.ListId = L.ListId
WHERE AccountId = 1;


--H DISPLAY ALL MOVIES THAT PLAY IN THE NEXT 7 DAYS

DECLARE @CurrentDate DATETIME = GETDATE();
DECLARE @DatePlusWeek DATETIME = GETDATE() + 7;

SELECT *
FROM Theaters.Movie
WHERE ShowDate >= @CurrentDate AND ShowDate <= @DatePlusWeek;


--i display all movies in between 2 given dates

SELECT Title, AgeRating, ShowDate, Storyline
FROM Theaters.Movie
WHERE ShowDate BETWEEN '2021-01-01'AND '2021-04-30';

--j add a helpful vote to a movie review

BEGIN TRANSACTION
	INSERT INTO Theaters.Review (MovieId, ListId, StarRating, Comment, ReviewDate, Total)
	VALUES (4, 1, 5, 'Incredible movie. Much better than anything Marvel could ever put out.', '2021-04-17 01:00:00', 3)
--Rollback to undo
ROLLBACK TRANSACTION
--Commit to finalize review
COMMIT TRANSACTION



--k display customers who have written most reviews for fantasy movies

GO
WITH FantasyReviewList (FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList) AS
(
	SELECT FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList
	FROM Sales.Account
	WHERE AccountId = 3
)

SELECT NickName
FROM FantasyReviewList;

--l display all customers purchasing history/receipts
SELECT * FROM Sales.Account;

SELECT A.AccountId, Nickname, R.TicketId, MovieTitle, FoodName, SouvenirName
FROM Sales.Merchandise AS M JOIN Sales.Receipt AS R
ON M.MerchandiseId = R.MerchandiseId
JOIN Sales.Account AS A ON A.AccountId = R.AccountId
JOIN Sales.Ticket AS T ON T.TicketId = R.TicketId;

--m display all seat numbers for those who need delivery within the next hour

SELECT A.FirstName, A.LastName, R.Reminder, T.RoomId, T.Seat
FROM Sales.Receipt AS R JOIN Sales.Merchandise AS M
ON R.MerchandiseId = M.MerchandiseId
JOIN Sales.Account AS A
ON R.AccountId = A.AccountId
JOIN Sales.Ticket AS T
ON R.TicketId = T.TicketId
