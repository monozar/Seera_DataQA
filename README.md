![](https://argaamplus.s3.amazonaws.com/159afd60-8669-4140-aa9e-fe46791f515d.png)

## Data QA - Code Challenge
#### By: Mohammad Za'areer
#### Submitted On: 17 Feb, 2024

### Challenge One:
**Task Summary:**     
The task involved validating customer-related data in an SQL table and determining whether the table is suitable for sign-off and sharing with stakeholders. The validation was performed using SQL queries, and the output was reviewed for potential issues. Within this link, you'll discover the SQL validation queries along with their corresponding results.

**Validation Results:** 
1. NULL Values:
  - Identified NULL values in columns: PhoneNumber, Email, State, Birthdate and Zip Code.
  - Suggested action: Address the NULL values, ensuring completeness and accuracy.

2. Invalid Email Addresses:
  - Detected invalid email addresses: ‘sarah.lee@invalidemail’ and ‘jane.doe@invalidemail’
  - Suggested action: Correct or remove email addresses

3. Inconsistent Birthdate Formats: 
  - Identitifed an invalid birthdate format: ’02-02-1990’
  - Suggested action: standardize birthdate formats to ‘YYYY-MM-DD’

4. Identical Phone Numbers:
  - All customers share identical phone numbers
  - Suggested action: each phone number must be distinct

**QA Sign-off:**  
Sharing the table with stakeholders is not possible due to identical phone numbers for all customers. Additionally, there are null values in the email and phone number fields.

