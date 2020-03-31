from config.dbconfig import pg_config
import psycopg2


class CategoryDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllCategories(self):
        cursor = self.conn.cursor()
        query = "select catid, cattype from category;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getCategoryById(self, catid):
        cursor = self.conn.cursor()
        query = "select catid, cattype from category where catid = %s;"
        cursor.execute(query, (catid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getCategoryByType(self, cattype):
        cursor = self.conn.cursor()
        query = "select catid, cattype from category where cattype = %s;"
        cursor.execute(query, (cattype,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getCategoryByIdAndType(self, catid, cattype):
        cursor = self.conn.cursor()
        query = "select catid, cattype from category where catid = %s and cattype = %s;"
        cursor.execute(query, (catid, cattype))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addCategory(self, cattype):
        if cattype:
            cursor = self.conn.cursor()
            query = '''INSERT INTO category(cattype)
                            VALUES(%s) returning catid;'''
            cursor.execute(query, (cattype,))
            catid = cursor.fetchone()
            self.conn.commit()
            return catid
        else:
            return None

    def deleteCategory(self, catid):
        cursor = self.conn.cursor()
        query = "delete from category where catid = %s;"
        cursor.execute(query, (catid,))
        self.conn.commit()
        return catid

    def update(self, catid, cattype):
        cursor = self.conn.cursor()
        query = "update category set cattype = %s where catid = %s;"
        cursor.execute(query, (cattype, catid))
        self.conn.commit()
        return catid

