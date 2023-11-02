import psycopg2

def generate_new_partid(cursor):
    # Retrieve the maximum existing partid from the bikeparts table
    cursor.execute("SELECT MAX(partid) FROM bikeparts")
    max_partid = cursor.fetchone()[0]

    if max_partid is not None:
        # Extract the numeric portion of the maximum partid and increment it
        numeric_part = int(max_partid[2:])  # Remove the 'BP' prefix and convert to an integer
        new_numeric_part = numeric_part + 1

        # Generate the new partid in the desired format, e.g., 'BP001'
        new_partid = f'BP{new_numeric_part:03}'
    else:
        # If no existing partid, start with 'BP001'
        new_partid = 'BP001'

    return new_partid

def insert_new_bikepart(partname, supplier_id, partdescription):
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="BUILDER",
            password="Ser1ousPwd",
            host="localhost",
            port="54321"
        )
        cursor = conn.cursor()

        # Generate the new partid based on the existing pattern
        new_partid = generate_new_partid(cursor)

        # Insert the new bike part with the generated partid
        cursor.execute("INSERT INTO bikeparts (partid, partname, suppliers_supplierid, partdescription) "
                       "VALUES (%s, %s, %s, %s)",
                       (new_partid, partname, supplier_id, partdescription))

        # Commit the transaction
        conn.commit()

        print(f"New bike part added with ID: {new_partid}")

    except Exception as e:
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    partname = input("Enter the part name: ")
    supplier_id = int(input("Enter the supplier ID: "))
    partdescription = input("Enter the part description: ")

    insert_new_bikepart(partname, supplier_id, partdescription)
