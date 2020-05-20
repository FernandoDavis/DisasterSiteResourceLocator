from config.dbconfig import pg_config
import psycopg2

class SupplyDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllSuppliesAvailable(self):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where is_available = 't' order by resname;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getAllSuppliesOrderedOrReserved(self):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where is_available = 'f' order by resname;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getAllResourcesAvailable(self):
        cursor = self.conn.cursor()
        query = "select resid, catid, resname, resdescription, reslocation from supply natural inner join resource where is_available = 't' order by resname;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyById(self, suid):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where suid = %s order by resname;"
        cursor.execute(query, (suid,))
        result = []
        for row in cursor:
            result.append(row)
        return result


    def getResourceBySupplyId(self, suid):
        cursor = self.conn.cursor()
        query = "select resid, catid, resname, resdescription, reslocation from supply natural inner join resource where suid = %s order by resname;"
        cursor.execute(query, (suid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyByResourceName(self, resname):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where resname like %(like)s and is_available = 't' order by resname;"
        data_dict = dict()
        data_dict['like'] = '%' + resname + '%'
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyByCategory(self, cattype):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource natural inner join category where cattype like %(like)s and is_available = 't' order by resname;"
        data_dict = dict()
        data_dict['like'] = '%' + cattype + '%'
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def insertSupply(self, catid, resdescription, resname, reslocation, sid, suprice, suquantity):
        cursor = self.conn.cursor()
        query = '''with rows as (INSERT INTO resource(catid, resdescription, resname, reslocation) VALUES (%s, %s, %s, %s) Returning resid)
                    INSERT INTO supply(sid, resid, suprice, suquantity)
                    VALUES (%s, (select resid from rows), %s, %s) returning suid;'''
        cursor.execute(query, (catid, resdescription, resname, reslocation, sid, suprice, suquantity))
        suid = cursor.fetchone()[0]
        self.conn.commit()
        return suid
