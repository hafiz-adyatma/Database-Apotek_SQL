/*
CREATE TABLE Customer 
(
    CustomerId CHAR(5) NOT NULL,
    CustomerName VARCHAR(50),
    CustomerGender VARCHAR(10),
    CustomerPhone VARCHAR(13),
    CustomerAddress VARCHAR(100),
    PRIMARY KEY(CustomerId),
    CONSTRAINT Check_CustId CHECK(CustomerId LIKE ('CU[0-9][0-9][0-9]')),
    CONSTRAINT Check_CustGen CHECK(CustomerGender IN ('Male', 'Female'))
);

CREATE TABLE Doctor
(
    DoctorID CHAR(5) NOT NULL,
    DoctorName VARCHAR(50),
	DoctorGender VARCHAR(10),
    Specialization CHAR(50),
	DoctorPhone VARCHAR(13),
	DoctorAddress VARCHAR(100),
    PRIMARY KEY(DoctorId),
	CONSTRAINT Check_DocId CHECK(DoctorId LIKE ('DO[0-9][0-9][0-9]')),
	CONSTRAINT Check_DocGen CHECK(DoctorGender IN ('Male', 'Female'))
);

CREATE TABLE Staff 
(
    StaffId CHAR(5) NOT NULL,
    StaffName VARCHAR(50),
    StaffGender VARCHAR(10),
    StaffPhone VARCHAR(13),
    StaffAddress VARCHAR(100),
    PRIMARY KEY(StaffId),
    CONSTRAINT Check_StaffId CHECK(StaffId LIKE ('SF[0-9][0-9][0-9]')),
	CONSTRAINT Check_StaffGen CHECK(StaffGender IN('Male', 'Female'))
);

CREATE TABLE Prescription 
(
    PrescriptionId CHAR(5) NOT NULL,
    CustomerId CHAR(5) NOT NULL,
	DoctorId CHAR(5) NOT NULL,
    PRIMARY KEY(PrescriptionId),
    FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(DoctorId) REFERENCES Doctor(DoctorId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_PresId CHECK(PrescriptionId LIKE ('PR[0-9][0-9][0-9]'))
);

CREATE TABLE MedicineType
(
	MedicineTypeId CHAR(5) NOT NULL,
	MedicineTypeName VARCHAR(50),
	PRIMARY KEY(MedicineTypeId),
	CONSTRAINT Check_MedTypeId CHECK(MedicineTypeId LIKE ('MT[0-9][0-9][0-9]'))
);

CREATE TABLE Medicine
(
	MedicineId CHAR(5) NOT NULL,
	MedicineTypeId CHAR(5) NOT NULL,
	MedicineName VARCHAR(50),
	MedicinePrice NUMERIC(10,2),
	Stock INT,
	PRIMARY KEY(MedicineId),
	FOREIGN KEY(MedicineTypeId) REFERENCES MedicineType(MedicineTypeId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_MedId CHECK(MedicineId LIKE ('MD[0-9][0-9][0-9]'))
);

CREATE TABLE MedicineDetail 
(
	PrescriptionId CHAR(5) NOT NULL,
    MedicineId CHAR(5) NOT NULL,
	ItemAvailability VARCHAR(20)
	PRIMARY KEY(PrescriptionId),
	FOREIGN KEY(PrescriptionId) REFERENCES Prescription(PrescriptionId) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(MedicineId) REFERENCES Medicine(MedicineId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TransactionMain
(
	TransactionId CHAR(5) NOT NULL,
	CustomerId CHAR(5) NOT NULL,
	StaffId CHAR(5) NOT NULL,
	TransactionDate DATE,
	TotalPayment NUMERIC(10,2),
	PaymentType VARCHAR(20)
	PRIMARY KEY(TransactionId),
	FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(StaffId) REFERENCES Staff(StaffId) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Check_TransId CHECK(TransactionId LIKE ('TR[0-9][0-9][0-9]'))
);

CREATE TABLE TransactionDetail
(
	TransactionDetailId CHAR(5) NOT NULL,
	TransactionId CHAR(5) NOT NULL,
	MedicineId CHAR(5) NOT NULL,
	TotalMedicine INT,
	TotalPrice NUMERIC(10,2)
	PRIMARY KEY(TransactionDetailId),
	FOREIGN KEY(TransactionId) REFERENCES TransactionMain(TransactionId) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(MedicineId) REFERENCES Medicine(MedicineId) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Check_TransDetId CHECK(TransactionDetailId LIKE ('TD[0-9][0-9][0-9]'))
);
*/

INSERT INTO Customer(CustomerId, CustomerName, CustomerGender, CustomerPhone, CustomerAddress)
VALUES
('CU001', 'Riccardo Kaka', 'Male', '081345723455', 'Italia Street no 6'),
('CU002', 'Tsubasa Ozora', 'Male', '081110225566', 'Nankatsu Street no 8'),
('CU003', 'Jennie Kim', 'Female', '081744006611', 'Blackpink Area no 120'),
('CU004', 'Lionel Messi', 'Male', '085114882135', 'Argentina Street no 10'),
('CU005', 'Tom Brady', 'Male', '087755321666', 'Tampa Bay no 42'),
('CU006', 'Shohei Ohtani', 'Male', '087715322778', 'Los Angeles no 65'),
('CU007', 'Alexandra Daddario', 'Female', '085757321123', 'New York Street no 42'),
('CU008', 'Trey Lance', 'Male', '08111188822', 'Trey Area no 77'),
('CU009', 'Joe Burrow', 'Male', '08787311222', 'Cincinnati Bengals no 1'),
('CU010', 'Marcus Semien', 'Male', '08777331322', 'Texas Rangers no 98');

INSERT INTO Doctor(DoctorId, DoctorName, DoctorGender, Specialization, DoctorPhone, DoctorAddress)
VALUES
('DO001', 'Jimmy Garoppolo', 'Male', 'Jantung', '081345671111', 'Bay Area no 6'),
('DO002', 'Hyunjin Ryu', 'Male', 'Mata', '087110225068', 'Toronto Street no 8'),
('DO003', 'Cristiano Ronaldo', 'Male', 'Saraf', '081675001612', 'Manchester Street no 7'),
('DO004', 'Jennifer Lawrence', 'Female', 'Nutrisi', '081212782137', 'District no 12');

INSERT INTO Staff(StaffId, StaffName, StaffGender, StaffPhone, StaffAddress)
VALUES
('SF001', 'Kojiro Hyuga', 'Male', '08526541122', 'Meiwa Street no 43'),
('SF002', 'Trevor Lawrence', 'Male', '085755552021', 'Jacksonville Street no 17'),
('SF003', 'Olivia Rodrigo', 'Female', '081214747777', 'California Street no 19'),
('SF004', 'Jennifer Alba', 'Female', '085567213151', 'Fantastic Four no 87');

INSERT INTO Prescription(PrescriptionId, CustomerId, DoctorId)
VALUES
('PR001', 'CU001', 'DO001'),
('PR002', 'CU001', 'DO004'),
('PR003', 'CU002', 'DO001'),
('PR004', 'CU003', 'DO004'),
('PR005', 'CU004', 'DO003'),
('PR006', 'CU005', 'DO001'),
('PR007', 'CU005', 'DO004'),
('PR008', 'CU006', 'DO002'),
('PR009', 'CU007', 'DO002'),
('PR010', 'CU008', 'DO004'),
('PR011', 'CU008', 'DO003'),
('PR012', 'CU009', 'DO002'),
('PR013', 'CU010', 'DO001'),
('PR014', 'CU010', 'DO001');

INSERT INTO MedicineType(MedicineTypeId, MedicineTypeName)
VALUES
('MT001', 'Jantung'),
('MT002', 'Mata'),
('MT003', 'Saraf'),
('MT004', 'Nutrisi');

INSERT INTO Medicine(MedicineId, MedicineTypeId, MedicineName, MedicinePrice, Stock)
VALUES
('MD001', 'MT001', 'Akrinor Tablet', 7500, 10),
('MD002', 'MT001', 'Tiaryt Tablet', 6000, 7),
('MD003', 'MT002', 'Cendo Fenicol', 27000, 5),
('MD004', 'MT002', 'Albucid', 80000, 6),
('MD005', 'MT002', 'Interflox Tetes Mata', 85000, 10),
('MD006', 'MT003', 'Fordesia Tablet', 31000, 14),
('MD007', 'MT004', 'Cerebrovit Active', 140000, 9),
('MD008', 'MT004', 'Vitacur Syrup', 50000, 5);

INSERT INTO MedicineDetail(PrescriptionId, MedicineId, ItemAvailability)
VALUES
('PR001', 'MD001', 'Available'),
('PR002', 'MD008', 'Available'),
('PR003', 'MD002', 'Available'),
('PR004', 'MD008', 'Available'),
('PR005', 'MD006', 'Available'),
('PR006', 'MD001', 'Available'),
('PR007', 'MD007', 'Available'),
('PR008', 'MD003', 'Available'),
('PR009', 'MD005', 'Available'),
('PR010', 'MD007', 'Available'),
('PR011', 'MD006', 'Available'),
('PR012', 'MD004', 'Available'),
('PR013', 'MD001', 'Available'),
('PR014', 'MD002', 'Available');

INSERT INTO TransactionMain(TransactionId, CustomerId, StaffId, TransactionDate, TotalPayment, PaymentType)
VALUES
('TR001', 'CU001', 'SF001' , '2022/01/02', 57500, 'Cash'),
('TR002', 'CU002', 'SF001' , '2022/01/02', 6000, 'Cash'),
('TR003', 'CU003', 'SF003' , '2022/01/02', 50000, 'Debit'),
('TR004', 'CU004', 'SF002' , '2022/01/03', 31000, 'Cash'),
('TR005', 'CU005', 'SF004' , '2022/01/03', 147500, 'Debit'),
('TR006', 'CU006', 'SF003' , '2022/01/04', 27000, 'Cash'),
('TR007', 'CU007', 'SF001' , '2022/01/04', 85000, 'Debit'),
('TR008', 'CU008', 'SF003' , '2022/01/04', 171000, 'Cash'),
('TR009', 'CU009', 'SF004' , '2022/01/05', 80000, 'Cash'),
('TR010', 'CU010', 'SF004' , '2022/01/05', 13500, 'Cash');

INSERT INTO TransactionDetail(TransactionDetailId, TransactionId, MedicineId, TotalMedicine, TotalPrice)
VALUES
('TD001', 'TR001', 'MD001', 1, 7500),
('TD002', 'TR001', 'MD008', 1, 50000),
('TD003', 'TR002', 'MD002', 1, 6000),
('TD004', 'TR003', 'MD008', 1, 50000),
('TD005', 'TR004', 'MD006', 1, 31000),
('TD006', 'TR005', 'MD001', 1, 7500),
('TD007', 'TR005', 'MD007', 1, 140000),
('TD008', 'TR006', 'MD003', 1, 27000),
('TD009', 'TR007', 'MD005', 1, 85000),
('TD010', 'TR008', 'MD007', 1, 140000),
('TD011', 'TR008', 'MD006', 1, 31000),
('TD012', 'TR009', 'MD004', 1, 80000),
('TD013', 'TR010', 'MD001', 1, 7500),
('TD014', 'TR010', 'MD002', 1, 6000);
