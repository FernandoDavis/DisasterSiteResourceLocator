from config.dbconfig import pg_config
import psycopg2


class SupplierDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllSuppliers(self):
        cursor = self.conn.cursor()
        query = "select * from supplier;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addSupplier(self, uid):
        if uid:
            cursor = self.conn.cursor()
            query = '''INSERT INTO supplier(saddress, uid)
                            VALUES('', %s) returning sid;'''
            cursor.execute(query, (uid,))
            sid = cursor.fetchone()
            self.conn.commit()
            return sid
        else:
            return None

    def deleteSupplier(self, uid):
        cursor = self.conn.cursor()
        query = "delete from supplier where uid = %s;"
        cursor.execute(query, (uid,))
        self.conn.commit()
        return uid
    #
    # def update(self, uid, uname, upass, first_name, last_name):
    #     cursor = self.conn.cursor()
    #     query = "update users set uname = %s, upass = %s, first_name = %s, last_name = %s where uid = %s;"
    #     cursor.execute(query, (uname, upass, first_name, last_name, uid,))
    #     self.conn.commit()
    #     return uid
