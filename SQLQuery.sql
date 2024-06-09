use creditcards;

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);
BULK INSERT cc_detail
FROM 'F:\data analysis\first power pi project\credit_card.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

CREATE TABLE cc_detail_staging (
    Client_Num VARCHAR(50),
    Card_Category VARCHAR(50),
    Annual_Fees VARCHAR(50),
    Activation_30_Days VARCHAR(50),
    Customer_Acq_Cost VARCHAR(50),
    Week_Start_Date VARCHAR(50),
    Week_Num VARCHAR(50),
    Qtr VARCHAR(50),
    current_year VARCHAR(50),
    Credit_Limit VARCHAR(50),
    Total_Revolving_Bal VARCHAR(50),
    Total_Trans_Amt VARCHAR(50),
    Total_Trans_Ct VARCHAR(50),
    Avg_Utilization_Ratio VARCHAR(50),
    Use_Chip VARCHAR(50),
    Exp_Type VARCHAR(50),
    Interest_Earned VARCHAR(50),
    Delinquent_Acc VARCHAR(50)
);
BULK INSERT cc_detail_staging
FROM 'F:\data analysis\first power pi project\credit_card.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT cc_detail_staging
FROM 'F:\data analysis\first power pi project\cc_add.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
drop table cc_detail;
drop table cc_detail_staging;
INSERT INTO cc_detail (
    Client_Num,
    Card_Category,
    Annual_Fees,
    Activation_30_Days,
    Customer_Acq_Cost,
    Week_Start_Date,
    Week_Num,
    Qtr,
    current_year,
    Credit_Limit,
    Total_Revolving_Bal,
    Total_Trans_Amt,
    Total_Trans_Ct,
    Avg_Utilization_Ratio,
    Use_Chip,
    Exp_Type,
    Interest_Earned,
    Delinquent_Acc
)
SELECT 
    TRY_CAST(Client_Num AS INT),
    Card_Category,
    TRY_CAST(Annual_Fees AS INT),
    TRY_CAST(Activation_30_Days AS INT),
    TRY_CAST(Customer_Acq_Cost AS INT),
    TRY_CONVERT(DATE, Week_Start_Date, 103),  -- Use the British/French format (DD-MM-YYYY)
    Week_Num,
    Qtr,
    TRY_CAST(current_year AS INT),
    TRY_CAST(Credit_Limit AS DECIMAL(10,2)),
    TRY_CAST(Total_Revolving_Bal AS INT),
    TRY_CAST(Total_Trans_Amt AS INT),
    TRY_CAST(Total_Trans_Ct AS INT),
    TRY_CAST(Avg_Utilization_Ratio AS DECIMAL(10,3)),
    Use_Chip,
    Exp_Type,
    TRY_CAST(Interest_Earned AS DECIMAL(10,3)),
    Delinquent_Acc
FROM cc_detail_staging
WHERE TRY_CONVERT(DATE, Week_Start_Date, 103) IS NOT NULL;


-------
-- let's create the second table
-- 2. Create cust_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

BULK INSERT cust_detail
FROM 'F:\data analysis\first power pi project\customer.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT cust_detail
FROM 'F:\data analysis\first power pi project\cust_add.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


select * from  cust_detail




