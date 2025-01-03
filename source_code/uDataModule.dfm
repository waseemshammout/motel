object dm: Tdm
  Height = 480
  Width = 640
  object con: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Waseem\Desktop\motel\db\db.sdb'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object InitiateSchema: TFDQuery
    Connection = con
    SQL.Strings = (
      '/*'
      '  Drop tables'
      '*/'
      ''
      'Drop table if exists payments;'
      'Drop table if exists booking_guests_details;'
      'Drop table if exists guests;'
      'Drop table if exists bookings;'
      'Drop table if exists rooms;'
      ''
      ''
      '/*'
      '  Create tables'
      '*/'
      ''
      'create table rooms'
      '('
      '    room_id integer primary key autoincrement,'
      '    room_number varchar(100) unique,'
      '    description varchar(100) unique,'
      '    standard_rate_per_night real,'
      '    beds integer,'
      '    max_capacity_guests integer,'
      '    has_kitchen boolean,'
      '    has_bath boolean,'
      '    has_fridge boolean,'
      '    has_safe boolean,'
      '    has_tv boolean,'
      
        '    room_status varchar(100) default '#39'OOS'#39' check (room_status in' +
        ' ('#39'Occupied'#39','#39'Vacant'#39','#39'OOS'#39')),'
      '    created_at timestamp default CURRENT_TIMESTAMP'
      ');'
      ''
      'create table guests'
      '('
      '    guest_id integer primary key autoincrement,'
      '    first_name varchar(100),'
      '    last_name varchar(100),'
      '    date_of_birth date,'
      '    birth_country varchar(100),'
      '    id_number varchar(100),'
      '    id_type varchar(100),'
      '    sex varchar(100) check (sex in ('#39'Male'#39', '#39'Female'#39')),'
      '    phone varchar(100),'
      '    email varchar(100),'
      '    guardian_id integer,'
      '    created_at timestamp default CURRENT_TIMESTAMP'
      ');'
      ''
      'create table bookings'
      '('
      '    booking_id integer primary key autoincrement,'
      '    booking_num varchar(100) unique,'
      '    checkin_date date,'
      '    checkout_date date,'
      '    nights int,'
      '    room_id integer references rooms (room_id),'
      '    rate_per_night real,'
      '    total_amount real,'
      
        '    status varchar(100) default '#39'Pending'#39' check (status in ('#39'Pen' +
        'ding'#39','#39'Confirmed'#39','#39'CheckedIn'#39','#39'CheckedOut'#39','#39'Canceled'#39') ),'
      '    settled_amount real default 0,'
      '    created_at timestamp default CURRENT_TIMESTAMP,'
      '    confirmed_at timestamp,'
      '    checkedin_at timestamp,'
      '    checkedout_at timestamp,'
      '    canceled_at timestamp'
      ');'
      ''
      'create table booking_guests_details'
      '('
      '    id integer primary key autoincrement,'
      '    booking_id integer references bookings (booking_id),'
      '    guest_id integer references guests (guest_id),'
      '    contact_guest boolean,'
      '    created_at timestamp default CURRENT_TIMESTAMP'
      ');'
      ''
      'create table payments'
      '('
      '    payment_id integer primary key autoincrement,'
      '    payment_num varchar(100) unique,'
      '    payment_date date,'
      
        '    payment_type varchar(100) check (payment_type in ('#39'Cash'#39', '#39'C' +
        'redit Card'#39', '#39'Crypto'#39')),'
      '    amount real not null,'
      '    exchange_rate real not null,'
      '    usd_equivalent real not null,'
      
        '    currency varchar(10) check (currency in ('#39'USD'#39', '#39'EUR'#39', '#39'GBP'#39 +
        ', '#39'BTC'#39', '#39'ETH'#39', '#39'USDC'#39', '#39'USDT'#39', '#39'SOL'#39')),'
      
        '    booking_id integer not null references bookings (booking_id)' +
        ','
      '    created_at timestamp default CURRENT_TIMESTAMP'
      ');'
      ''
      '/*'
      '  Triggers'
      '*/'
      ''
      'CREATE TRIGGER populate_booking_number'
      'AFTER INSERT ON bookings'
      'FOR EACH ROW'
      'BEGIN'
      '    UPDATE bookings'
      
        '    SET booking_num = '#39'BM-'#39' || strftime('#39'%Y%m'#39', NEW.created_at) ' +
        '|| '#39'-'#39' || (SELECT COUNT(*) + 1 FROM bookings WHERE strftime('#39'%Y%' +
        'm'#39', created_at) = strftime('#39'%Y%m'#39', NEW.created_at))'
      '    WHERE booking_id = NEW.booking_id;'
      'END;'
      ''
      'CREATE TRIGGER populate_payment_number'
      'AFTER INSERT ON payments'
      'FOR EACH ROW'
      'BEGIN'
      '    UPDATE payments'
      
        '    SET payment_num = '#39'PM-'#39' || strftime('#39'%Y%m'#39', NEW.created_at) ' +
        '|| '#39'-'#39' || (SELECT COUNT(*) + 1 FROM payments WHERE strftime('#39'%Y%' +
        'm'#39', created_at) = strftime('#39'%Y%m'#39', NEW.created_at))'
      '    WHERE payment_id = NEW.payment_id;'
      ''
      '    UPDATE bookings'
      
        '    SET settled_amount = (SELECT sum(usd_equivalent) FROM paymen' +
        'ts WHERE booking_id = NEW.booking_id)'
      '    WHERE booking_id = NEW.booking_id;'
      'END;'
      ''
      '/*'
      '  Dummy data'
      '*/'
      ''
      'INSERT INTO guests'
      
        #9'(first_name, last_name, date_of_birth, birth_country, id_number' +
        ', id_type, sex, phone, email, guardian_id)'
      #9'VALUES'
      
        #9'('#39'Waseem'#39', '#39'Shammut'#39', '#39'1984-04-16'#39', '#39'KSA'#39', '#39'99252035342'#39', '#39'Turk' +
        'ish Residency Permit'#39', '#39'Male'#39', '#39'+90 538 827 87 59'#39', '#39'wshammout@g' +
        'mail.com'#39',null),'
      
        #9'('#39'Dania'#39', '#39'Shammut'#39', '#39'1985-01-30'#39', '#39'SYR'#39', '#39'48069948032'#39', '#39'Turki' +
        'sh Identity'#39', '#39'Female'#39', '#39'+90 506 130 28 26'#39', '#39'daniaatr@gmail.com' +
        #39',null),'
      
        #9'('#39'Ammar'#39', '#39'Alsaeed'#39', '#39'1976-06-30'#39', '#39'SYR'#39', '#39'k3659995'#39', '#39'Russian ' +
        'passport'#39', '#39'Male'#39', null, null,null),'
      
        #9'('#39'Lobaba'#39', '#39'Alatrash'#39', '#39'1983-02-04'#39', '#39'SYR'#39', '#39'99352659955'#39', '#39'Syr' +
        'ian Identity'#39', '#39'Female'#39', '#39'+90 365 222 58 56'#39', null,null),'
      
        #9'('#39'Rahaf'#39', '#39'Shammut'#39', '#39'2022-03-01'#39', '#39'TUR'#39', null, '#39'Turkish Identi' +
        'ty'#39', '#39'Female'#39', null, null,1),'
      
        #9'('#39'Hassan'#39', '#39'Alsaeed'#39', '#39'2017-08-21'#39', '#39'TUR'#39', null, '#39'Turkish Ident' +
        'ity'#39', '#39'Male'#39', null, null,3)'
      ';'
      ''
      ''
      'INSERT INTO'
      
        '    rooms(room_number, description, standard_rate_per_night, bed' +
        's, max_capacity_guests, has_kitchen, has_bath, has_fridge, has_s' +
        'afe, has_tv, room_status)'
      #9'VALUES'
      
        #9'('#39'A10'#39', '#39'Single bed'#39', 60.99,1, 1, false,true,false,false,true,'#39 +
        'Vacant'#39'),'
      
        #9'('#39'A11'#39', '#39'Double bed'#39', 72.99,1, 2, false,true,true,false,true,'#39'V' +
        'acant'#39'),'
      
        #9'('#39'A12'#39', '#39'Kingsize bed'#39', 89.99,1, 3, false,true,true,false,true,' +
        #39'Vacant'#39'),'
      
        #9'('#39'B10'#39', '#39'2 Single beds'#39', 99.99,2, 2, false,true,true,false,true' +
        ','#39'Vacant'#39'),'
      
        #9'('#39'B11'#39', '#39'3 Single beds'#39', 144.99,3, 3, false,true,true,false,tru' +
        'e,'#39'Vacant'#39'),'
      
        #9'('#39'B12'#39', '#39'1 Double + 1 Single bed'#39', 114.99,2, 3, false,true,true' +
        ',false,true,'#39'Vacant'#39'),'
      
        #9'('#39'B13'#39', '#39'1 Double + 2 Single beds'#39', 174.99,3, 4, false,true,tru' +
        'e,false,true,'#39'Vacant'#39'),'
      
        #9'('#39'B14'#39', '#39'2 Double beds'#39', 139.99,2, 4, false,true,true,false,tru' +
        'e,'#39'Vacant'#39')'
      #9';'
      ''
      
        'INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_' +
        'per_night, nights, total_amount)'
      'VALUES  ('#39'2024-01-15'#39', '#39'2024-01-17'#39', 1, 54.25 , 2, 108.5);'
      
        'INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_' +
        'per_night, nights, total_amount)'
      'VALUES  ('#39'2024-02-10'#39', '#39'2024-02-13'#39', 5, 144.99, 3, 434.97);'
      
        'INSERT INTO bookings(checkin_date, checkout_date, room_id, rate_' +
        'per_night, nights, total_amount)'
      'VALUES  ('#39'2024-06-22'#39', '#39'2024-06-30'#39', 3, 89.99, 8, 719.92);'
      ''
      ''
      
        'INSERT INTO booking_guests_details(booking_id, guest_id, contact' +
        '_guest)'
      #9'VALUES'
      #9'(1, 1, true),'
      #9'(2, 1, true),'
      #9'(2, 2, false),'
      #9'(2, 5, false),'
      #9'(3, 3, true),'
      #9'(3, 4, false),'
      #9'(3, 6, false)'
      #9';'
      ''
      ''
      'INSERT INTO payments'
      
        #9'(payment_date, payment_type, amount, exchange_rate, usd_equival' +
        'ent, currency, booking_id)'
      #9'VALUES'
      #9'('#39'2024-01-15'#39', '#39'Cash'#39', 55, 1, 55, '#39'USD'#39', 1),'
      #9'('#39'2024-02-10'#39', '#39'Crypto'#39', 146.22, 1, 146.22 , '#39'USDT'#39', 2),'
      #9'('#39'2024-06-22'#39', '#39'Credit Card'#39', 89.99, 1, 89.99, '#39'USD'#39', 3)'
      #9';')
    Left = 32
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = con
    SQL.Strings = (
      'select * from bookings;')
    Left = 304
    Top = 224
  end
end
