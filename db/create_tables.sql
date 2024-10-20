/*
  Drop tables
*/

Drop table if exists payments;
Drop table if exists booking_guests_details;
Drop table if exists guests;
Drop table if exists bookings;
Drop table if exists rooms;


/*
  Create tables
*/

create table rooms
(
    room_id integer primary key autoincrement,
    room_number varchar(100) unique,
    description varchar(100) unique,
    standard_rate_per_night real,
    beds integer,
    max_capacity_guests integer,
    has_kitchen boolean,
    has_bath boolean,
    has_fridge boolean,
    has_safe boolean,
    has_tv boolean,
    room_status varchar(100) default 'OOS' check (room_status in ('Occupied','Vacant','OOS')),
    created_at timestamp default CURRENT_TIMESTAMP
);

create table guests
(
    guest_id integer primary key autoincrement,
    first_name varchar(100),
    last_name varchar(100),
    date_of_birth date,
    birth_country varchar(100),
    id_number varchar(100),
    id_type varchar(100),
    sex varchar(100) check (sex in ('Male', 'Female')),
    phone varchar(100),
    email varchar(100),
    guardian_id integer,
    created_at timestamp default CURRENT_TIMESTAMP
);

create table bookings
(
    booking_id integer primary key autoincrement,
    booking_num varchar(100) unique,
    checkin_date date,
    checkout_date date,
    nights int,
    room_id integer references rooms (room_id),
    rate_per_night real,
    total_amount real,
    status varchar(100) default 'Pending' check (status in ('Pending','Confirmed','Checked-In','Checked-Out','Canceled') ),
    settled_amount real default 0,
    created_at timestamp default CURRENT_TIMESTAMP
);

create table booking_guests_details
(
    id integer primary key autoincrement,
    booking_id integer references bookings (booking_id),
    guest_id integer references guests (guest_id),
    contact_guest boolean,
    created_at timestamp default CURRENT_TIMESTAMP
);

create table payments
(
    payment_id integer primary key autoincrement,
    payment_num varchar(100) unique,
    payment_date date,
    payment_type varchar(100) check (payment_type in ('Cash', 'Credit Card', 'Crypto')),
    amount real,
    currency varchar(10) check (currency in ('USD', 'EUR', 'GBP', 'BTC', 'ETH', 'USDC', 'USDT')),
    booking_id integer not null references bookings (booking_id),
    created_at timestamp default CURRENT_TIMESTAMP
);
