-- name: GetTask :one
SELECT * FROM tasks WHERE id = $1 LIMIT 1;

-- name: CreateTask :exec
DO $$
BEGIN
	IF (SELECT role FROM users WHERE id = $1) = 'technician' THEN
		INSERT INTO tasks (user_id, title, description)
		VALUES ($1, $2, $3)
	ELSE
		RAISE EXCEPTION 'You are not allowed to create a tasks'
	END IF;
END $$;

-- name: UpdateTask :exec
UPDATE tasks SET title = $2, description = $3 WHERE id = $1;

-- name: DeleteTask :exec
DELETE FROM tasks WHERE id = $1;

-- name: GetTasks :many
SELECT * FROM tasks;

-- name: GetTasksByUser :many
SELECT * FROM tasks WHERE user_id = $1;

-- name: GetUser :one
SELECT * FROM users WHERE id = $1 LIMIT 1;

-- name: GetUsers :many
SELECT * FROM users;

-- name: CreateUser :exec
INSERT INTO users (name, role) VALUES ($1, $2);

-- name: UpdateUser :exec
UPDATE users SET name = $2, role = $3 WHERE id = $1;

-- name: DeleteUser :exec
DELETE FROM users WHERE id = $1;

-- name: GetRole :one
SELECT * FROM role WHERE id = $1 LIMIT 1;

-- name: GetRoles :many
SELECT * FROM role;

-- default roles
INSERT INTO role (id, name) VALUES (1, 'technician');
INSERT INTO role (id, name) VALUES (2, 'manager');
