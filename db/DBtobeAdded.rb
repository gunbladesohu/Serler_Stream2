### please add the table/data into seeds.rb when merging codes.
### '####' mean real comments
### '#' means SQL statements
### create table logs

# drop table adminlogs;
# create table AdminLogs
# (id int CONSTRAINT firstkey PRIMARY KEY,
# user_id int not null REFERENCES users (id),
# occur_time timestamp default now(),
# description char(100)
# );


###the user 'test@test.com/1111111' is for testing Admin add/edit/delete users

# insert into users(first_name, last_name, email,gender, dob, affiliation, is_active,created_at, updated_at, password_digest)
# values('test_first', 'test_last', 'test@test.com','Female' , now(),'apple', 'true',now(), now(), '1111111' );
#
# commit;
#
# select * from users;
# select * from roles;
# select * from users_roles
# select * from AdminLogs;

#
### please use the real 'id' of user 'test@test.com' instead of id '6'
# insert into users_roles (user_id, role_id, is_active, created_at, updated_at)
# values (6, 4, 'true', now(), now());
# insert into users_roles (user_id, role_id, is_active, created_at, updated_at)
# values (1, 4, 'true', now(), now());
# insert into users_roles (user_id, role_id, is_active, created_at, updated_at)
# values (2, 4, 'true', now(), now());
# insert into users_roles (user_id, role_id, is_active, created_at, updated_at)
# values (3, 4, 'true', now(), now());
# commit;
#
