use airport_management; --to database "airport_management is used"

CREATE TABLE user (
    user_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE,
    mobile_no VARCHAR(15)
);


INSERT INTO user (user_id, first_name, last_name, gender, date_of_birth, mobile_no) VALUES
('AI40901', 'Anupam', 'Soni', 'M', '2000-09-09', '9392349222'),
('AI40911', 'Siddharth', 'Shukla', 'M', '1999-06-04', '8583859553'),
('AI40912', 'Sonia', 'Nigam', 'F', '1999-12-21', '5839923492'),
('AI40933', 'Vanshi', 'Pandey', 'F', '1998-12-31', '8857474222'),
('AI40954', 'Minakshi', 'Gupta', 'F', '2000-07-12', '5566377228'),
('AI40955', 'Uttanshi', 'Singhania', 'F', '2001-03-24', '9994382827'),
('AI40970', 'Kamakshi', 'Mishra', 'F', '2000-01-01', '7483838929'),
('AI40975', 'Vansh', 'Tyagi', 'M', '1997-03-23', '9938376633'),
('AI40979', 'Vikrant', 'Gupta', 'M', '1998-02-25', '8846628437'),
('AI40999', 'Karan', 'Kaushik', 'M', '2000-02-28', '9574637638');

Select * from user;

CREATE TABLE baggage (
    user_id VARCHAR(10),
    baggage_id VARCHAR(10),
    flight_no VARCHAR(10),
    weight DECIMAL(5, 2),
    PRIMARY KEY (user_id, baggage_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);


INSERT INTO baggage (user_id, baggage_id, flight_no, weight) VALUES
('AI40901', 'BG001', 'AIC666', 50),
('AI40911', 'BG002', 'IGO6022', 51),
('AI40912', 'BG003', 'VTI957', 44),
('AI40933', 'BG004', 'QP1719', 55),
('AI40954', 'BG005', 'IGO6022', 53),
('AI40955', 'BG006', 'VTI957', 56),
('AI40955', 'BG007', 'VTI957', 57),
('AI40970', 'BG008', 'AIC665', 54),
('AI40970', 'BG009', 'AIC665', 35),
('AI40975', 'BG010', 'QP1719', 56),
('AI40979', 'BG011', 'SG7401', 50),
('AI40999', 'BG012', 'AIC665', 52),
('AI40999', 'BG013', 'AIC665', 49);


CREATE TABLE flight (
    flight_no VARCHAR(10) PRIMARY KEY,
    flight_name VARCHAR(50),
    arrival_time TIME,
    source VARCHAR(50),
    departure_time TIME,
    destination VARCHAR(50),
    distance INT,
    seat_availability INT
);


INSERT INTO flight (flight_no, flight_name, arrival_time, source, departure_time, destination, distance, seat_availability) VALUES
('AIC666', 'Air India', '14:00', 'New Delhi', '13:00', 'Mumbai', 1146, 3),
('AIC665', 'Air India', '16:00', 'New Delhi', '15:00', 'Mumbai', 1146, 20),
('IGO6022', 'Indigo', '18:30', 'Mumbai', '16:15', 'Varanasi', 1245, 32),
('VTI957', 'Vistara', '23:10', 'Bangalore', '20:05', 'New Delhi', 1703, 22),
('QP1719', 'Akasa Air', '10:00', 'Varanasi', '07:00', 'Bangalore', 1826, 10),
('SG7401', 'SpiceJet', '12:00', 'Varanasi', '10:00', 'New Delhi', 667, 5);


CREATE TABLE tickets (
    pnr_no VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    flight_no VARCHAR(10),
    date DATE,
    passenger_name VARCHAR(50),
    class VARCHAR(20),
    source VARCHAR(50),
    destination VARCHAR(50),
    seat_no VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (flight_no) REFERENCES flight(flight_no)
);


INSERT INTO tickets (pnr_no, user_id, flight_no, date, passenger_name, class, source, destination, seat_no) VALUES
('pnr001', 'AI40901', 'AIC666', '2024-05-03', 'Anupam', 'Economy', 'New Delhi', 'Mumbai', '17A'),
('pnr002', 'AI40911', 'IGO6022', '2024-05-05', 'Siddharth', 'First', 'Mumbai', 'Varanasi', '12B'),
('pnr003', 'AI40912', 'VTI957', '2024-05-10', 'Sonia', 'Business', 'Bangalore', 'New Delhi', '06D'),
('pnr004', 'AI40933', 'QP1719', '2024-05-11', 'Vanshi', 'Economy', 'Varanasi', 'Bangalore', '07E'),
('pnr005', 'AI40954', 'IGO6022', '2024-05-11', 'Minakshi', 'Economy', 'Mumbai', 'Varanasi', '18D'),
('pnr006', 'AI40955', 'VTI957', '2024-05-15', 'Uttanshi', 'Business', 'Bangalore', 'New Delhi', '01C'),
('pnr007', 'AI40970', 'AIC665', '2024-05-17', 'Kamakshi', 'First', 'New Delhi', 'Mumbai', '01D'),
('pnr008', 'AI40975', 'SG7401', '2024-05-17', 'Vansh', 'Economy', 'Varanasi', 'New Delhi', '09B'),
('pnr009', 'AI40979', 'AIC665', '2024-05-20', 'Vikrant', 'Business', 'New Delhi', 'Mumbai', '02A'),
('pnr010', 'AI40999', 'QP1719', '2024-05-25', 'Karan', 'Economy', 'Varanasi', 'Bangalore', '15C');


CREATE TABLE payment (
    user_id VARCHAR(10),
    pnr_no VARCHAR(10),
    flight_no VARCHAR(10),
    amount DECIMAL(10, 2),
    payment_mode VARCHAR(50),
    PRIMARY KEY (user_id, pnr_no, flight_no),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (pnr_no) REFERENCES tickets(pnr_no),
    FOREIGN KEY (flight_no) REFERENCES flight(flight_no)
);


INSERT INTO payment (user_id, pnr_no, flight_no, amount, payment_mode) VALUES
('AI40901', 'pnr001', 'AIC666', 5000.00, 'Credit Card'),
('AI40911', 'pnr002', 'IGO6022', 8000.00, 'Debit Card'),
('AI40912', 'pnr003', 'VTI957', 10000.00, 'Google Pay'),
('AI40933', 'pnr004', 'QP1719', 3000.00, 'Credit Card'),
('AI40954', 'pnr005', 'IGO6022', 4000.00, 'Direct Bank Transfer'),
('AI40955', 'pnr006', 'VTI957', 10000.00, 'Paytm'),
('AI40970', 'pnr007', 'AIC665', 7000.00, 'Credit Card'),
('AI40975', 'pnr008', 'SG7401', 4500.00, 'Google Pay'),
('AI40979', 'pnr009', 'AIC665', 15000.00, 'Debit Card'),
('AI40999', 'pnr010', 'QP1719', 3000.00, 'Cash');

CREATE TABLE Airline (
    flight_no VARCHAR(10),
    airline_name VARCHAR(50),
    contact_no VARCHAR(15),
    PRIMARY KEY (flight_no),
    FOREIGN KEY (flight_no) REFERENCES flight(flight_no)
);

INSERT INTO Airline(flight_no, airline_name, contact_no) VALUES
('AIC666', 'AirIndia', '7773737773'),
('AIC665', 'AirIndia', '7773737773'),
('IGO6022', 'Indigo', '9933383883'),
('VTI957', 'Vistara', '2229399444'),
('QP1719', 'Akasa Air', '1183488333'),
('SG7401', 'SpiceJet', '7773882882');

select * from user;
select * from baggage;
select * from flight;
select * from tickets;
select * from payment;
select * from Airline;