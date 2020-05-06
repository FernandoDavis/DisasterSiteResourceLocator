from config.dbconfig import pg_config
import psycopg2


class RequestDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllRequests(self):
        cursor = self.conn.cursor()
        query = "select reqid, cid, is_void, reqdate, reqquantity, resid, catid, resname, resdescription, reslocation from request natural inner join resource order by resname;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getAllResourcesRequested(self):
        cursor = self.conn.cursor()
        query = "select resid, catid, resname, resdescription, reslocation from resource order by resname;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getRequestById(self, reqid):
        cursor = self.conn.cursor()
        query = "select reqid, cid, is_void, reqdate, reqquantity, resid, catid, resname, resdescription, reslocation from request natural inner join resource where reqid = %s;"
        cursor.execute(query, (reqid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getResourceByRequestId(self, reqid):
        cursor = self.conn.cursor()
        query = "select resid, catid, resname, resdescription, reslocation from request natural inner join resource where reqid = %s;"
        cursor.execute(query, (reqid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    # Needs testing!!!!!!!!
    def getRequestByResourceName(self, resname):
        cursor = self.conn.cursor()
        query = "select reqid, cid, is_void, reqdate, reqquantity, resid, catid, resname, resdescription, reslocation from request natural inner join resource where resname like %(like)s order by resname;"
        data_dict = dict()
        data_dict['like'] = '%' + resname + '%'
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getRequestByCategory(self, cattype):
        cursor = self.conn.cursor()
        query = "select reqid, cid, is_void, reqdate, reqquantity, resid, catid, resname, resdescription, reslocation from request natural inner join resource natural inner join category where cattype like %(like)s order by resname;"
        data_dict = dict()
        data_dict['like'] = '%' + cattype + '%'
        cursor.execute(query, data_dict)
        result = []
        for row in cursor:
            result.append(row)
        return result

    # def insertRequest(self, catid, resdescription, resname, reslocation, sid, suprice, suquantity):
    #     cursor = self.conn.cursor()
    #     query = '''with rows as (INSERT INTO resource(catid, resdescription, resname, reslocation) VALUES (1, 'bottled water requested, please', 'Bottled Water', 'another address') Returning resid)
    #                 INSERT INTO request(cid, resid)
    #                 VALUES (1, (select resid from rows));'''
    #     cursor.execute(query, (catid, resdescription, resname, reslocation, sid, suprice, suquantity))
    #     reqid = cursor.fetchone()[0]
    #     self.conn.commit()
    #     return suid


