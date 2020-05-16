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
        query = "select aid, uid, uname, upass, first_name, last_name from administrator natural inner join users;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getAdministratorByAdminId(self, aid):
        cursor = self.conn.cursor()
        query = "select aid, uid, uname, upass, first_name, last_name from administrator natural inner join users where aid = %s;"
        cursor.execute(query, (aid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getAdministratorByUserId(self, uid):
        cursor = self.conn.cursor()
        query = "select aid, uid, uname, upass, first_name, last_name from administrator natural inner join users where uid = %s;"
        cursor.execute(query, (uid,))
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


