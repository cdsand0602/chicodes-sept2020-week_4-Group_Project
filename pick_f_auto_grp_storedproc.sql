CREATE OR REPLACE PROCEDURE cust_info(
	serialNum VARCHAR(100),
	firstName VARCHAR(100),
	lastName VARCHAR(100),
	loc_ VARCHAR(150),
	telephone BIGINT,
	payment VARCHAR(100)
)
language plpgsql
as $$
BEGIN
	INSERT INTO car(serial_number)
	VALUES(serialNum);
	
	INSERT INTO customer(serial_number,first_name,last_name,address,phone,billing_info)
	VALUES(serialNum,firstName,lastName,loc_,telephone,payment);
	
	
	COMMIT;
END;
$$
CREATE OR REPLACE PROCEDURE carInfo(
	serial_numberU VARCHAR(100),
	colorU VARCHAR(100),
	makeU VARCHAR(100),
	modelU VARCHAR(100),
	year_U INTEGER,
	new_U BOOLEAN
)
language plpgsql
AS $$
BEGIN
	UPDATE car
	SET 
		color = colorU,
		make = makeU,
		model = modelU,
		year_ = year_U,
		new_ = new_U
	WHERE serial_number = serial_numberU;
	COMMIT;
END;
$$

CALL cust_info('123','Fred','Ramos','5234 W. Moth St. Chicago, IL, 60641',3126085111,'4242424242424241'); 
CALL carInfo('123','brown','ford','focus',2015,False);
CALL cust_info('1','Crystal','Sanders','1234 W. Moth St. Chicago, IL, 60621',3128059066,'4242424242424242'); 
CALL carInfo('1','brown','ford','focus',2016,False);
CALL cust_info('2', 'Frank', 'Ramus', '1235 S. Elston St. Chicago, IL, 60341', 3128059123, '4242424242424241'); 
CALL carInfo('2', 'red', 'ford', 'taurus', 2020, True);
CALL cust_info('3', 'Ida', 'McCarty', '124 N. Armitage Ave. Chicago, IL, 68641', 3128059029, '4242424242424241'); 
CALL carInfo('3', 'silver', 'audi', 'series 3', 2020, True);

-- Checking
SELECT *
FROM customer;

SELECT *
FROM car;