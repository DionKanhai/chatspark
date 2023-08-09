DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_friends CASCADE;
DROP TABLE IF EXISTS user_friend_requests CASCADE;
DROP TABLE IF EXISTS user_blocked CASCADE;
DROP TABLE IF EXISTS user_sessions CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS user_chat_groups CASCADE;
DROP TABLE IF EXISTS user_chat_group_members CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);

CREATE TABLE user_friends (
  id SERIAL PRIMARY KEY NOT NULL,
  users_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
);

CREATE TABLE user_friend_requests (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  receiver_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  request_status VARCHAR(10) NOT NULL,
  UNIQUE (sender_id, receiver_id)
);

CREATE TABLE user_blocked (
  id SERIAL PRIMARY KEY NOT NULL,
  users_blocked_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE (users_id, users_blocked_id)
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY NOT NULL,
  sender_id INTEGER NOT NULL REFERENCES users(id),
  receiver_id INTEGER NOT NULL REFERENCES users(id),
  timestamp TIMESTAMPTZ DEFAULT NOW(),
  message_text TEXT NOT NULL,
);

CREATE TABLE user_sessions (
  id PRIMARY SERIAL KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  session_token VARCHAR(100) NOT NULL,
  expiration_date TIMESTAMP NOT NULL,
  UNIQUE (user_id, session_token)
);

CREATE TABLE user_chat_groups (
  id SERIAL PRIMARY KEY NOT NULL,
  group_name VARCHAR(100) NOT NULL,
  group_description TEXT,
  created_by INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE user_chat_group_members (
  id SERIAL PRIMARY KEY NOT NULL,
  group_id INTEGER NOT NULL REFERENCES user_chat_groups(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE 
)