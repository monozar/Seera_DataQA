![](https://argaamplus.s3.amazonaws.com/159afd60-8669-4140-aa9e-fe46791f515d.png)

## Data QA - Code Challenge
#### By: Mohammad Za'areer
#### Submitted On: 17 Feb, 2024

### Challenge One:
**Task Summary:**     
The task involved validating customer-related data in an SQL table and determining whether the table is suitable for sign-off and sharing with stakeholders.The validation was performed using SQL queries(MySQL as DBMS), and the output was reviewed for potential issues. You'll discover the SQL validation queries along with their corresponding results for this challenge within this repo under 'Chanllenge one' directory

**Validation Results:** 
1. NULL Values:
   - Identified NULL values in columns: PhoneNumber, Email, State, Birthdate and Zip Code.
   - Suggested action: Address the NULL values, ensuring completeness and accuracy.

2. Invalid Email Addresses:
   - Detected invalid email addresses: "sarah.lee@invalidemail" and "jane.doe@invalidemail"
   - Suggested action: Correct or remove email addresses

3. Inconsistent Birthdate Formats: 
   - Identitifed an invalid birthdate format: ’02-02-1990’
   - Suggested action: standardize birthdate formats to ‘YYYY-MM-DD’

4. Identical Phone Numbers:
   - All customers share identical phone numbers
   - Suggested action: each phone number must be distinct
    
5. Duplicate Emails
   - Identified cutomers have the same email address: "john.smith@email.com" and "bob.johnson@example.com"
   - Suggested action: each Email address must be distinct
     
6. Possible Duplicate records
   - Identified instances of records that are nearly identical, differing only in one null field; for instance, record 1 closely matches record 7, and record 4 with 10.
   
**QA Sign-off:**  
Sharing the table with stakeholders is not possible due to these reasons: 
 - identical phone numbers for all customers.
 - Null values in the email and phone number fields.
 - invalid email addresses.
 - Duplicate email addresses.

### Challenge Two:
**Task Summary**: 
validating the transformed table against specific business requirements, and ensuring the presence of required attributes with corresponding logic for generating a Finance report for Service transactions.The validation was performed using SQL queries(MySQL as DBMS), and the output was reviewed for potential issues. You'll discover the SQL validation queries along with their corresponding results for this challenge within this repo under 'Chanllenge Two' directory

**Validation Results:** 

