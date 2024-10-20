
/*
  Dummy data
*/

INSERT INTO guests
	(first_name, last_name, date_of_birth, birth_country, id_number, id_type, sex, phone, email, guardian_id)
	VALUES
	('Waseem', 'Shammut', '1984-04-16', 'KSA', '99252035342', 'Turkish Residency Permit', 'Male', '+90 538 827 87 59', 'wshammout@gmail.com',null),
	('Dania', 'Shammut', '1985-01-30', 'SYR', '48069948032', 'Turkish Identity', 'Female', '+90 506 130 28 26', 'daniaatr@gmail.com',null),
	('Ammar', 'Alsaeed', '1976-06-30', 'SYR', 'k3659995', 'Russian passport', 'Male', null, null,null),
	('Lobaba', 'Alatrash', '1983-02-04', 'SYR', '99352659955', 'Syrian Identity', 'Female', '+90 365 222 58 56', null,null),
	('Rahaf', 'Shammut', '2022-03-01', 'TUR', null, 'Turkish Identity', 'Female', null, null,1),
	('Hassan', 'Alsaeed', '2017-08-21', 'TUR', null, 'Turkish Identity', 'Male', null, null,3)
;


INSERT INTO
    rooms(room_number, description, standard_rate_per_night, beds, max_capacity_guests, has_kitchen, has_bath, has_fridge, has_safe, has_tv, room_status)
	VALUES
	('A10', 'Single bed', 60.99,1, 1, false,true,false,false,true,'Vacant'),
	('A11', 'Double bed', 72.99,1, 2, false,true,true,false,true,'Vacant'),
	('A12', 'Kingsize bed', 89.99,1, 3, false,true,true,false,true,'Vacant'),
	('B10', '2 Single beds', 99.99,2, 2, false,true,true,false,true,'Vacant'),
	('B11', '3 Single beds', 144.99,3, 3, false,true,true,false,true,'Vacant'),
	('B12', '1 Double + 1 Single bed', 114.99,2, 3, false,true,true,false,true,'Vacant'),
	('B13', '1 Double + 2 Single beds', 174.99,3, 4, false,true,true,false,true,'Vacant'),
	('B14', '2 Double beds', 139.99,2, 4, false,true,true,false,true,'Vacant')
	;

INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_per_night)
VALUES  ('2024-01-15', '2024-01-17', 1, 54.25 );
INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_per_night)
VALUES  ('2024-02-10', '2024-02-13', 5, 144.99);
INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_per_night)
VALUES  ('2024-06-22', '2024-06-30', 3, 89.99);


INSERT INTO booking_guests_details(booking_id, guest_id, contact_guest)
	VALUES
	(1, 1, true),
	(2, 1, true),
	(2, 2, false),
	(2, 5, false),
	(3, 3, true),
	(3, 4, false),
	(3, 6, false)
	;


INSERT INTO payments
	(payment_date, payment_type, amount, currency, booking_id)
	VALUES
	('2024-01-15', 'Cash', 55, 'USD', 1),
	('2024-02-10', 'Crypto', 146.22, 'USDT', 2),
	('2024-06-22', 'Credit Card', 89.99, 'USD', 3)
	;