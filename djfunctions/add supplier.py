import psycopg2

def insert_new_supplier(suppliername, contactnumber):
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="BUILDER",
            password="Ser1ousPwd",
            host="localhost",
            port="54321"  # Use the correct port number
        )
        cursor = conn.cursor()

        # Call the PL/pgSQL function to insert a new supplier
        cursor.callproc("insert_new_supplier", [suppliername, contactnumber])
        result = cursor.fetchone()

        # Commit the transaction
        conn.commit()

        print(result[0])

    except Exception as e:
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    suppliername = input("Enter the supplier name: ")
    contactnumber = input("Enter the contact number: ")

    insert_new_supplier(suppliername, contactnumber)
