from config.dbconfig import pg_config
import psycopg2


class AdministratorDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllAdministrators(self):
        cursor = self.conn.cursor()
        query = "select * from administrator;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addAdministrator(self, uid):
        if uid:
            cursor = self.conn.cursor()
            query = '''INSERT INTO administrator(uid)
                            VALUES(%s) returning aid;'''
            cursor.execute(query, (uid,))
            aid = cursor.fetchone()
            self.conn.commit()
            return aid
        return None

    def deleteAdministrator(self, uid):
        cursor = self.conn.cursor()
        query = "delete from administrator where uid = %s;"
        cursor.execute(query, (uid,))
        self.conn.commit()
        return uid

    # def getUserById(self, uid):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where uid = %s;"
    #     cursor.execute(query, (uid,))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByUsername(self, uname):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where uname = %s;"
    #     cursor.execute(query, (uname,))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByFirstname(self, first_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where first_name = %s;"
    #     cursor.execute(query, (first_name,))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByLastname(self, last_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where last_name = %s;"
    #     cursor.execute(query, (last_name,))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByUserAndFirstAndLastname(self, uname, first_name, last_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where uname = %s and first_name = %s and last_name = %s;"
    #     cursor.execute(query, (uname, first_name, last_name))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByUserAndFirstname(self, uname, first_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where uname = %s and first_name = %s;"
    #     cursor.execute(query, (uname, first_name))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByUserAndLastname(self, uname, last_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where uname = %s and last_name = %s;"
    #     cursor.execute(query, (uname, last_name))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def getUserByFirstAndLastname(self, first_name, last_name):
    #     cursor = self.conn.cursor()
    #     query = "select * from users where first_name = %s and last_name = %s;"
    #     cursor.execute(query, (first_name, last_name))
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def addAdminUser(self, utype, uname, upass, first_name, last_name):
    #     # Create user then call the method for the appropiate type of user to create that
    #     # type as well
    #     if utype == 'Administrator':
    #         cursor = self.conn.cursor()
    #         query = '''INSERT INTO users(uname, upass, first_name, last_name)
    #                         VALUES(%s, %s, %s, %s) Returning uid;'''
    #         uid = cursor.execute(query, (uname, upass, first_name, last_name))
    #         self.conn.commit()
    #         if uid:
    #             # call the method for administrators
    #             return uid
    #         else:
    #             return None
    #     else:
    #         return None
    #
    # def addRegularUser(self, utype, uname, upass, first_name, last_name):
    #     # Create user then call the method for the appropiate type of user to create that
    #     # type as well
    #     if utype == 'Consumer' or utype == 'Supplier':
    #         cursor = self.conn.cursor()
    #         query = '''INSERT INTO users(uname, upass, first_name, last_name)
    #                         VALUES(%s, %s, %s, %s);'''
    #         uid = cursor.execute(query, (uname, upass, first_name, last_name))
    #         self.conn.commit()
    #         if uid:
    #             # call the method for consumer/suppliers
    #             if utype == 'Consumer':
    #                 return  # dummy
    #             else:
    #                 return  # dummy
    #             return uid
    #         else:
    #             return None
    #
    # def deleteUser(self, uid):
    #     # Gotta delete the supplier/admin/consumer associated with this user.
    #     # supplier.deleteSupplier()
    #     cursor = self.conn.cursor()
    #     query = "delete from user where uid = %s;"
    #     cursor.execute(query, (uid,))
    #     self.conn.commit()
    #     return uid
    #
    # def update(self, uid, uname, upass, first_name, last_name):
    #     cursor = self.conn.cursor()
    #     query = "update users set uname = %s, upass = %s, first_name = %s, last_name = %s where uid = %s;"
    #     cursor.execute(query, (uname, upass, first_name, last_name, uid,))
    #     self.conn.commit()
    #     return uid
