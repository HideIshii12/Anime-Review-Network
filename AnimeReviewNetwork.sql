CREATE TABLE characters (
 character_id INT NOT NULL,
 firstName CHAR(50),
 lastName CHAR(50),
 title CHAR(50)
);

ALTER TABLE characters ADD CONSTRAINT PK_characters PRIMARY KEY (character_id);


CREATE TABLE descriptions (
 description_id INT NOT NULL,
 description CHAR(1000)
);

ALTER TABLE descriptions ADD CONSTRAINT PK_descriptions PRIMARY KEY (description_id);


CREATE TABLE genres (
 genre_id INT NOT NULL,
 genre CHAR(50)
);

ALTER TABLE genres ADD CONSTRAINT PK_genres PRIMARY KEY (genre_id);


CREATE TABLE anime (
 anime_id INT NOT NULL,
 originalName CHAR(50),
 synonym CHAR(50),
 firstAired CHAR(50),
 genre_id INT
);

ALTER TABLE anime ADD CONSTRAINT PK_anime PRIMARY KEY (anime_id);


CREATE TABLE anime_characters (
 anime_id INT NOT NULL,
 character_id INT NOT NULL
);

ALTER TABLE anime_characters ADD CONSTRAINT PK_anime_characters PRIMARY KEY (anime_id,character_id);


CREATE TABLE anime_descriptions (
 anime_id INT NOT NULL,
 description_id INT NOT NULL
);

ALTER TABLE anime_descriptions ADD CONSTRAINT PK_anime_descriptions PRIMARY KEY (anime_id,description_id);


CREATE TABLE blogs (
 blog_id INT NOT NULL,
 timestamp TIMESTAMP WITH TIME ZONE(10),
 anime_id INT
);

ALTER TABLE blogs ADD CONSTRAINT PK_blogs PRIMARY KEY (blog_id);


CREATE TABLE characters_descriptions (
 character_id INT NOT NULL,
 description_id INT NOT NULL
);

ALTER TABLE characters_descriptions ADD CONSTRAINT PK_characters_descriptions PRIMARY KEY (character_id,description_id);


CREATE TABLE posts (
 post_id INT NOT NULL,
 post CHAR(1000),
 blog_id INT
);

ALTER TABLE posts ADD CONSTRAINT PK_posts PRIMARY KEY (post_id);


ALTER TABLE anime ADD CONSTRAINT FK_anime_0 FOREIGN KEY (genre_id) REFERENCES genres (genre_id);


ALTER TABLE anime_characters ADD CONSTRAINT FK_anime_characters_0 FOREIGN KEY (anime_id) REFERENCES anime (anime_id);
ALTER TABLE anime_characters ADD CONSTRAINT FK_anime_characters_1 FOREIGN KEY (character_id) REFERENCES characters (character_id);


ALTER TABLE anime_descriptions ADD CONSTRAINT FK_anime_descriptions_0 FOREIGN KEY (anime_id) REFERENCES anime (anime_id);
ALTER TABLE anime_descriptions ADD CONSTRAINT FK_anime_descriptions_1 FOREIGN KEY (description_id) REFERENCES descriptions (description_id);


ALTER TABLE blogs ADD CONSTRAINT FK_blogs_0 FOREIGN KEY (anime_id) REFERENCES anime (anime_id);


ALTER TABLE characters_descriptions ADD CONSTRAINT FK_characters_descriptions_0 FOREIGN KEY (character_id) REFERENCES characters (character_id);
ALTER TABLE characters_descriptions ADD CONSTRAINT FK_characters_descriptions_1 FOREIGN KEY (description_id) REFERENCES descriptions (description_id);


ALTER TABLE posts ADD CONSTRAINT FK_posts_0 FOREIGN KEY (blog_id) REFERENCES blogs (blog_id);


