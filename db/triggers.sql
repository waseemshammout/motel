/*
  Triggers
*/

CREATE TRIGGER populate_booking_number
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
    UPDATE bookings
    SET booking_num = 'BM-' || strftime('%Y%m', NEW.created_at) || '-' ||
                         (SELECT COUNT(*) + 1 FROM bookings WHERE strftime('%Y%m', created_at) = strftime('%Y%m', NEW.created_at))
    WHERE booking_id = NEW.booking_id;
END;
