--6 a. modify user review
--
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

WITH AccountWatchList (FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList) AS
(
	SELECT FirstName, LastName, NickName, Email, Phone, ViewedMovie, WatchList
	FROM Sales.Account
	WHERE AccountId = 5
)

SELECT NickName, WatchList 
FROM AccountWatchList;


--c display all movies a customer has already viewed

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