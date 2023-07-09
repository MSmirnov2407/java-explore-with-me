CREATE TABLE IF NOT EXISTS categories (
 id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
 name VARCHAR (255) NOT NULL,
 CONSTRAINT pk_category PRIMARY KEY (id),
 CONSTRAINT uq_categories_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS users (
 id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
 name VARCHAR (255) NOT NULL,
 email VARCHAR (255) NOT NULL,
 CONSTRAINT pk_users PRIMARY KEY (id),
 CONSTRAINT uq_user_email UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS events (
 id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
 annotation VARCHAR(2000) NOT NULL,
 category INTEGER NOT NULL,
 confirmed_requests INTEGER NOT NULL,
 created_on TIMESTAMP WITHOUT TIME ZONE NOT NULL,
 description VARCHAR (7000) NOT NULL,
 event_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
 initiator INTEGER NOT NULL,
 location_lat FLOAT NOT NULL,
 location_lon FLOAT NOT NULL,
 paid BOOLEAN NOT NULL,
 participant_limit INT NOT NULL,
 published_on TIMESTAMP WITHOUT TIME ZONE NOT NULL,
 request_moderation BOOLEAN NOT NULL,
 state VARCHAR(20) NOT NULL,
 title VARCHAR (255) NOT NULL,
 CONSTRAINT pk_events PRIMARY KEY (id),
 CONSTRAINT fk_event_user FOREIGN KEY (initiator) REFERENCES users (id),
 CONSTRAINT fk_event_category FOREIGN KEY (category) REFERENCES categories (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS compilations (
 id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
 pinned BOOLEAN NOT NULL,
 title VARCHAR (255) NOT NULL,
 CONSTRAINT pk_compilations PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS event_compilation (
 event_id INTEGER REFERENCES events (id) ON DELETE CASCADE,
 compilation_id INTEGER REFERENCES compilations (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS participation_requests (
 id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
 created TIMESTAMP WITHOUT TIME ZONE NOT NULL,
 event INTEGER NOT NULL,
 requester INTEGER NOT NULL,
 status VARCHAR (255) NOT NULL,
 CONSTRAINT pk_part_requests PRIMARY KEY (id),
 CONSTRAINT fk_pr_events FOREIGN KEY (event) REFERENCES events (id),
 CONSTRAINT fk_pr_users FOREIGN KEY (requester) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS comments (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  text VARCHAR(512) NOT NULL,
  event_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  CONSTRAINT pk_comment PRIMARY KEY (id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES users (id),
  CONSTRAINT fk_comment_event FOREIGN KEY (event_id) REFERENCES events (id)
);
