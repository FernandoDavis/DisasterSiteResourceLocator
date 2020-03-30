from config.dbconfig import pg_config
import psycopg2

from dao.administrator import AdministratorDAO
from dao.consumer import ConsumerDAO
from dao.supplier import SupplierDAO


class UsersDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def confirmUser(self, uname, upass, utype):
        cursor = self.conn.cursor()
        query = ""
        if utype == "Administrator":
            query = "select uid from users natural inner join administrator where uname = %s and upass = %s;"
        elif utype == "Supplier":
            query = "select uid from users natural inner join supplier where uname = %s and upass = %s;"
        elif utype == "Consumer":
            query = "select uid from users natural inner join consumer where uname = %s and upass = %s;"
        cursor.execute(query, (uname, upass))
        result = cursor.fetchone()
        if result:
            uid = result[0]
            self.conn.commit()
        else:
            uid = None
        return uid

    def getAllUsers(self):
        cursor = self.conn.cursor()
        query = "select * from users;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserById(self, uid):
        cursor = self.conn.cursor()
        query = "select * from users where uid = %s;"
        cursor.execute(query, (uid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByUsername(self, uname):
        cursor = self.conn.cursor()
        query = "select * from users where uname = %s;"
        cursor.execute(query, (uname,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByFirstname(self, first_name):
        cursor = self.conn.cursor()
        query = "select * from users where first_name = %s;"
        cursor.execute(query, (first_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByLastname(self, last_name):
        cursor = self.conn.cursor()
        query = "select * from users where last_name = %s;"
        cursor.execute(query, (last_name,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByUserAndFirstAndLastname(self, uname, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select * from users where uname = %s and first_name = %s and last_name = %s;"
        cursor.execute(query, (uname, first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByUserAndFirstname(self, uname, first_name):
        cursor = self.conn.cursor()
        query = "select * from users where uname = %s and first_name = %s;"
        cursor.execute(query, (uname, first_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByUserAndLastname(self, uname, last_name):
        cursor = self.conn.cursor()
        query = "select * from users where uname = %s and last_name = %s;"
        cursor.execute(query, (uname, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getUserByFirstAndLastname(self, first_name, last_name):
        cursor = self.conn.cursor()
        query = "select * from users where first_name = %s and last_name = %s;"
        cursor.execute(query, (first_name, last_name))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addAdminUser(self, utype, uname, upass, first_name, last_name):
        # Create user then call the method for the appropiate type of user to create that
        # type as well
        if utype == 'Administrator':
            cursor = self.conn.cursor()
            query = '''INSERT INTO users(uname, upass, first_name, last_name)
                            VALUES(%s, %s, %s, %s) Returning uid;'''
            cursor.execute(query, (uname, upass, first_name, last_name))
            uid = cursor.fetchone()
            self.conn.commit()
            if uid:
                dao = AdministratorDAO()
                aid = dao.addAdministrator(uid)
                if aid:
                    return uid
                self.deleteUser(uid, '')
        return None

    def addRegularUser(self, utype, uname, upass, first_name, last_name):
        if utype == "Consumer" or utype == "Supplier":
            cursor = self.conn.cursor()
            query = '''INSERT INTO users(uname, upass, first_name, last_name)
                            VALUES(%s, %s, %s, %s) Returning uid;'''
            cursor.execute(query, (uname, upass, first_name, last_name))
            uid = cursor.fetchone()
            self.conn.commit()
            if uid:
                if utype == "Consumer":
                    dao = ConsumerDAO()
                    cid = dao.addConsumer(uid)
                    if cid:
                        return uid
                elif utype == "Supplier":
                    dao = SupplierDAO()
                    sid = dao.addSupplier(uid)
                    if sid:
                        return uid
                self.deleteUser(uid, '')  # if supplier/consumer where not created properly, delete user from db and return None
        return None

    def deleteUser(self, uid, utype):
        if utype == "Consumer":
            dao = ConsumerDAO
            result = dao.deleteConsumer()
        if utype == "Supplier":
            dao = SupplierDAO
            result = dao.deleteSupplier()
        if utype == "Administrator":
            dao = AdministratorDAO
            result = dao.deleteAdministrator()
        if result:
            cursor = self.conn.cursor()
            query = "delete from user where uid = %s;"
            cursor.execute(query, (uid,))
            self.conn.commit()
            return uid
        return None

    def update(self, uid, uname, upass, first_name, last_name):
        cursor = self.conn.cursor()
        query = "update users set uname = %s, upass = %s, first_name = %s, last_name = %s where uid = %s;"
        cursor.execute(query, (uname, upass, first_name, last_name, uid,))
        self.conn.commit()
        return uid
