drop TABLE emp_qualification;
drop TABLE employee;
drop TABLE department;


CREATE TABLE department
(
id 		    varchar(5),
name 		varchar(25),
budget 		decimal(12,2) 	default(0) not null,
date_of_estb 	date 		not null,
constraint deptt_id_pk 		primary key(id),
constraint deptt_name_uniq 	unique(name),
constraint deptt_budget_gz_chk 	check(budget>=0)
);


CREATE TABLE employee
(
id 		    varchar(5),
fname 		varchar(10) 	not null,
mname 		varchar(10),
sname 		varchar(10) 	not null,
address 	varchar(20) 	not null,
adhar_no 	varchar(16),
desig 		varchar(15)	not null,
salary 		decimal(8,2),
dob 		date 	     	not null,
gender 		char(1)      	check (gender in('M','F')),
mgr_id 		varchar(5),
deptt_id 	varchar(5),
constraint emp_adhar_no_uniq 	unique(adhar_no),
constraint emp_id_pk 		primary key(id),
constraint emp_mgr_id_fk   	foreign key(mgr_id)   	   references employee(id),
constraint emp_did_fk 		foreign key(deptt_id)      references department(id)
);

CREATE TABLE emp_qualification
(
emp_id varchar(5),
degree varchar(20),
constraint qualif_code_name_pk 	primary key(emp_id,degree),
constraint emp_id_fk 	foreign key(emp_id) references employee(id)
);



INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D01', 'health', 787000.00, '1974-03-09');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D02', 'education', 1257000.00, '1965-09-12');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D03', 'roads and buildings', 1785000.00, '1983-09-05');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D04', 'flood control', 554000.00, '1977-08-12');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D05', 'agriculture', 872500.00, '1968-01-27');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D06', 'revenue', 450400.00, '1969-07-28');
INSERT INTO `department` (`id`, `name`, `budget`, `date_of_estb`) VALUES ('D07', 'rural devlopment', 345000.00, '1970-05-22');


INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E001', 'showkat', 'ahmad', 'mir', 'kakar hmam baramulla', '1286452655128754', 'surgeon', 15600.00, '1981-12-24', 'M', NULL, 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E002', 'reyaz', 'ahmad', 'dar', 'dargah srinagar', '1286478745129854', 'pharmacist', 5200.00, '1970-10-28', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E003', 'shabir', 'ahmad', 'tantray', 'kakar hmam baramulla', '3286452345129854', 'lecturer', 9300.00, '1967-04-13', 'M', NULL, 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E004', 'bilal', 'ahmad', 'yatoo', 'soura srinagar', '1248451245129854', 'surgeon', 9300.00, '1961-11-18', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E005', 'kabir', 'ahmad', 'dar', 'ompora budgam', '1286687345129854', 'teacher', 5200.00, '1963-04-18', 'M', 'E003', 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E006', 'rayees', 'ahmad', 'mir', 'Sopore', '1286452332789854', 'master', 9300.00, '1961-10-04', 'M', 'E003', 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E007', 'latief', 'ahmad', 'wani', 'Ganderbal', '1286488745129854', 'teacher', 5200.00, '1981-09-28', 'M', 'E003', 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E008', 'junaid', 'ahmad', 'kakroo', 'Tulmulla Ganderbal', '1286452345127854', 'field assistant', 4200.00, '1982-12-28', 'M', 'E010', 'D05');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E009', 'gowhar', 'ahmad', 'kakroo', 'Safapora Ganderbal', '1286452345767854', 'field assistant', 4200.00, '1982-12-10', 'M', 'E010', 'D05');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E010', 'mohd', 'ayoub', 'shah', 'Pattan Baramulla', '1286452383129854', 'hort.Officer', 5200.00, '1979-04-07', 'M', NULL, 'D05');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E011', 'ab', 'rahim', 'rather', 'Bijbehara', '1289672345129854', 'hort. Assistant', 9300.00, '1965-12-16', 'M', 'E010', 'D05');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E012', 'sayima', 'maqbool', 'wani', 'Kh. Bagh Baramulla', '122752345129854', 'teacher', 5200.00, '1967-02-11', 'F', 'E003', 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E013', 'shugafta', '', 'tantray', 'Hamaray Sopore', '1286452345129854', 'physcian', 9300.00, '1967-06-03', 'F', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E014', 'nasreena', 'aziz', 'shah', 'Model Town Sopore', '1272455645129854', 'nurse', 4200.00, '1960-07-06', 'F', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E015', 'rabia', '', 'wani', 'Tangmarg', '1286452342875854', 'Junior assist', 4200.00, '1977-10-02', 'F', 'E010', 'D05');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E016', 'zubair', 'ahmad', 'dar', 'Kunzer tangmarg', '1371452345129854', 'junior assist', 4200.00, '1971-02-24', 'M', NULL, NULL);
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E017', 'shujat', '', 'bukhari', 'Anantanag', '1286452418129854', 'a engineear', 9300.00, '1968-03-10', 'M', 'E018', 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E018', 'mohd', 'ramzan', 'mir', 'Handwara', '1286423545129854', 'a ex Engineear', 9300.00, '1963-01-12', 'M', NULL, 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E019', 'mohd', 'sadeeq', 'teli', 'Uri', '1286452275129644', 'jr engineear', 5200.00, '1963-06-06', 'M', 'E018', 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E020', 'bashir', 'ahmad', 'rather', 'Wagoora Baramulla', '1267455845129854', 'jr engineear', 5200.00, '1977-04-20', 'M', 'E018', 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E021', 'haroon', 'ahmad', 'mir', 'Kreeri ', '1286452345379784', 'wrks supervisor', 4200.00, '1972-03-25', 'M', 'E018', 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E022', 'mohd', 'saleem', 'dar', 'Srinagar', '1286452347189854', 'drafts Man', 9300.00, '1981-04-08', 'M', 'E018', 'D03');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E023', 'burhan', 'ahmad', 'wani', 'Sanantanagar Sgr', '1271452345129854', 'teacher', 5200.00, '1971-10-03', 'M', 'E003', 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E024', 'arif', '', 'sheikh', 'Shopian', '1286452375176854', 'teacher', 5200.00, '1962-11-21', 'M', NULL, 'D02');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E025', 'javid', 'ahmad', 'bhat', 'down Sopore', '1286452474129854', 'nurse', 4200.00, '1982-07-06', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E026', 'parveena', NULL, 'akther', 'wagoora', '1286452762829854', 'nurse', 4200.00, '1987-09-06', 'F', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E027', 'naseer', 'ahmad', 'wagay', 'kulgam', '1286452765379854', 'nurse', 4200.00, '1984-07-14', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E028', 'aadil', 'hussain', 'kakroo', 'jalal abad sopore', '128647375379854', 'pharmacist', 4200.00, '1987-07-14', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E029', 'adil', 'ahmad', 'kanroo', 'down town anantanag', '1288215379854', 'medical assist', 4200.00, '1981-07-14', 'M', 'E001', 'D01');
INSERT INTO `employee` (`id`, `fname`, `mname`, `sname`, `address`, `adhar_no`, `desig`, `salary`, `dob`, `gender`, `mgr_id`, `deptt_id`) VALUES ('E030', 'aaadiil', 'ahmad', 'bhat', 'down town sopore', '1288215989854', 'orderly', 4200.00, '1988-07-14', 'M', 'E001', 'D01');


INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E001', 'DIP IN HA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E001', 'MBBS');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E001', 'MS');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E002', '12th');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E002', 'MMPHW');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E003', 'BED');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E003', 'BSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E003', 'M-PHILL');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E003', 'MSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E004', 'MBBS');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E004', 'MS');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E005', 'BA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E005', 'MA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E006', 'BSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E006', 'MED');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E007', '12th');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E007', 'BCOM');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E008', '12th');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E009', '10th');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E010', 'BSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E010', 'MSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E011', 'BSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E011', 'MSC');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E012', 'BA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E013', 'MBBS');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E014', 'FMPHW');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E015', 'BA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E016', 'BA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E017', 'BE');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E018', 'B Tech');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E018', 'M Tech');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E019', 'DIP IN CIVIL ENG');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E020', 'BE');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E021', '10TH');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E022', 'BTECH');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E023', 'BA');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E024', 'BED');
INSERT INTO `emp_qualification` (`emp_id`, `degree`) VALUES ('E024', 'BSC');
