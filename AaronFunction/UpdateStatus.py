import psycopg2

# Database connection parameters
db_params = {
    "dbname": "postgres",
    "user": "C21403052",
    "password": "Aaron",
    "host": "147.252.250.51",
    "port": "5432",
}

try:
    # Connect to the database
    conn = psycopg2.connect(**db_params)
    cursor = conn.cursor()

    SerialNumber=input("Enter Serial Number of bike: ");
    new_status=input("Enter new status of bike: "); # Replace with the new repair status
    postgres_Query = "SELECT update_bike_repair_status(%s, %s)"
    cursor.execute(postgres_Query, (SerialNumber, new_status))

    # Commit the changes to the database
    conn.commit()
    print("Repair status updated successfully.")

except psycopg2.Error as e:
    print("Error: ", e)
finally:
    cursor.close()
    conn.close()