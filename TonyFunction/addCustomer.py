import psycopg2
import getpass
import pandas as pd

try:
    connection = psycopg2.connect(
        host="147.252.250.51",
        user="C21481174",
        password=getpass.getpass(prompt='Password: '),
        port="5432",
        database="postgres"
    )
    cursor = connection.cursor()

    # Input customer details
    cusFName = input('Enter Customer First Name: ')
    cusLName = input('Enter Customer Last Name: ')
    cusNum = input('Enter Customer PhoneNumber: ')
    cusEmail = input('Enter Customer Email: ')

    postgreSQL_select_Query = "SELECT addCustomer(%s, %s, %s, %s)"
    cursor.execute(postgreSQL_select_Query, (cusFName, cusLName, cusNum, cusEmail))

    # Fetch the result
    result = cursor.fetchone()

    # Check if the result is not None
    if result:
        customer_id = result[0]
        print(f"Customer ID: {customer_id}")
    else:
        print("Customer not added successfully. Please check the addCustomer function.")

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL:", error)
finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")
