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
        query = "select sid, uid, uname, first_name, last_name, saddress from supplier natural inner join users;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierById(self, sid):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where sid = %s;"
        cursor.execute(query, (sid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUsername(self, uname):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s;"
        cursor.execute(query, (uname,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByFirstname(self, first_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where first_name = %s;"
        cursor.execute(query, (first_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByLastname(self, last_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where last_name = %s;"
        cursor.execute(query, (last_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByAddress(self, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where saddress = %s;"
        cursor.execute(query, (saddress,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndFirstAndLastname(self, uname, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and first_name = %s and last_name = %s;"
        cursor.execute(query, (uname, first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndFirstname(self, uname, first_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and first_name = %s;"
        cursor.execute(query, (uname, first_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndLastname(self, uname, last_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and last_name = %s;"
        cursor.execute(query, (uname, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByFirstAndLastname(self, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where first_name = %s and last_name = %s;"
        cursor.execute(query, (first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndFirstAndLastnameAndAddress(self, uname, first_name, last_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and first_name = %s and last_name = %s and saddress = %s;"
        cursor.execute(query, (uname, first_name, last_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndFirstnameAndAddress(self, uname, first_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and first_name = %s and saddress = %s;"
        cursor.execute(query, (uname, first_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUserAndLastnameAndAddress(self, uname, last_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and last_name = %s and saddress = %s;"
        cursor.execute(query, (uname, last_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByFirstAndLastnameAndAddress(self, first_name, last_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where first_name = %s and last_name = %s and saddress = %s;"
        cursor.execute(query, (first_name, last_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByFirstnameAndAddress(self, first_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where first_name = %s and saddress = %s;"
        cursor.execute(query, (first_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByLastnameAndAddress(self, last_name, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where last_name = %s and saddress = %s;"
        cursor.execute(query, (last_name, saddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplierByUsernameAndAddress(self, uname, saddress):
        cursor = self.conn.cursor()
        query = "select sid, uid, uname, upass, first_name, last_name, saddress from supplier natural inner join users where uname = %s and saddress = %s;"
        cursor.execute(query, (uname, saddress))
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

    def update(self, uid, saddress):
        cursor = self.conn.cursor()
        query = "update supplier set saddress = %s where uid = %s;"
        cursor.execute(query, (saddress, uid))
        self.conn.commit()
        return uid
