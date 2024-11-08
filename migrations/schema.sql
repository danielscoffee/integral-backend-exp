CREATE TABLE role (
    id INTEGER,
    name TEXT NOT NULL,
    CONSTRAINT roleid_check CHECK (id IN (1, 2))
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,
    role TEXT NOT NULL,
    CONSTRAINT role_check CHECK (role IN ('technician', 'manager'))
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL, 
    title TEXT NOT NULL,
    description VARCHAR(2500) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE permission (
    role_id INTEGER NOT NULL,
    visualizet BOOLEAN NOT NULL,
    createt BOOLEAN NOT NULL,
    readt BOOLEAN NOT NULL,
    updatet BOOLEAN NOT NULL,
    deletet BOOLEAN NOT NULL,
    visualize_all BOOLEAN NOT NULL,
    delete_all BOOLEAN NOT NULL,
    CONSTRAINT role_id_fk FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE 
);

