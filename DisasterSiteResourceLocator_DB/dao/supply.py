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

    def getResourceBySupplyId(self, reqid):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where reqid = %s order by resname;"
        cursor.execute(query, (reqid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    # Needs testing!!!!!!!!
    def getSupplyByResourceName(self, resname):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where resname like %(like)s and is_available = 't' order by resname;"
        data_dict = dict()
        data_dict['like'] = psycopg2.Binary('%' + resname + '%')
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyByCategory(self, cattype):
        cursor = self.conn.cursor()
        query = "select suid, sid, is_void, is_available, suprice, sudate, suquantity, resid, catid, resname, resdescription, reslocation from supply natural inner join resource where cattype like %(like)s and is_available = 't' order by resname;"
        data_dict = dict()
        data_dict['like'] = psycopg2.Binary('%' + cattype + '%')
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result