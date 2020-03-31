from config.dbconfig import pg_config
import psycopg2


class ConsumerDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllConsumers(self):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerById(self, cid):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where cid = %s;"
        cursor.execute(query, (cid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUsername(self, uname):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s;"
        cursor.execute(query, (uname,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByFirstname(self, first_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where first_name = %s;"
        cursor.execute(query, (first_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByLastname(self, last_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where last_name = %s;"
        cursor.execute(query, (last_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByAddress(self, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where caddress = %s;"
        cursor.execute(query, (caddress,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndFirstAndLastname(self, uname, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and first_name = %s and last_name = %s;"
        cursor.execute(query, (uname, first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndFirstname(self, uname, first_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and first_name = %s;"
        cursor.execute(query, (uname, first_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndLastname(self, uname, last_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and last_name = %s;"
        cursor.execute(query, (uname, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByFirstAndLastname(self, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where first_name = %s and last_name = %s;"
        cursor.execute(query, (first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndFirstAndLastnameAndAddress(self, uname, first_name, last_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and first_name = %s and last_name = %s and caddress = %s;"
        cursor.execute(query, (uname, first_name, last_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndFirstnameAndAddress(self, uname, first_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and first_name = %s and caddress = %s;"
        cursor.execute(query, (uname, first_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUserAndLastnameAndAddress(self, uname, last_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and last_name = %s and caddress = %s;"
        cursor.execute(query, (uname, last_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByFirstAndLastnameAndAddress(self, first_name, last_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where first_name = %s and last_name = %s and caddress = %s;"
        cursor.execute(query, (first_name, last_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByFirstnameAndAddress(self, first_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where first_name = %s and caddress = %s;"
        cursor.execute(query, (first_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByLastnameAndAddress(self, last_name, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where last_name = %s and caddress = %s;"
        cursor.execute(query, (last_name, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getConsumerByUsernameAndAddress(self, uname, caddress):
        cursor = self.conn.cursor()
        query = "select cid, uid, uname, upass, first_name, last_name, caddress from consumer natural inner join users where uname = %s and caddress = %s;"
        cursor.execute(query, (uname, caddress))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addConsumer(self, uid):
        if uid:
            cursor = self.conn.cursor()
            query = '''INSERT INTO consumer(caddress, uid)
                            VALUES('', %s) returning cid;'''
            cursor.execute(query, (uid,))
            cid = cursor.fetchone()
            self.conn.commit()
            return cid
        return None

    def deleteConsumer(self, uid):
        cursor = self.conn.cursor()
        query = "delete from consumer where uid = %s;"
        cursor.execute(query, (uid,))
        self.conn.commit()
        return uid

    def update(self, uid, caddress):
        cursor = self.conn.cursor()
        query = "update consumer set saddress = %s where uid = %s;"
        cursor.execute(query, (caddress, uid))
        self.conn.commit()
        return uid
