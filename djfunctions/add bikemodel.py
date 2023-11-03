import psycopg2

def insert_new_modelbike(modelname, suppliers_supplierid, quantityinstock):
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="C21315413",
            password=getpass.getpass(prompt='Password: '),
            host="147.252.250.51",
            port="5432"
        )
        cursor = conn.cursor()

        # Call the PL/pgSQL function to insert a new bike model
        cursor.callproc("insert_new_modelbike", [modelname, suppliers_supplierid, quantityinstock])
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
    modelname = input("Enter the model name: ")
    suppliers_supplierid = int(input("Enter the supplier ID: "))
    quantityinstock = int(input("Enter the quantity in stock: "))

    insert_new_modelbike(modelname, suppliers_supplierid, quantityinstock)
