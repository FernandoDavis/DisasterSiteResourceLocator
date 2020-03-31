from config.dbconfig import pg_config
import psycopg2


class OrderDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    # def getAllResourcesRequested(self):
    #     cursor = self.conn.cursor()
    #     query = "select resname, cattype, resdescription, reslocation, first_name, last_name from request natural inner join resource natural inner join category natural join supplier natural join users;"
    #     cursor.execute(query)
    #     result = []
    #     for row in cursor:
    #         result.append(row)
    #     return result
    #
    # def insertRequest(self, catid, resdescription, resname, reslocation, sid, suprice, suquantity):
    #     cursor = self.conn.cursor()
    #     query = '''with rows as (INSERT INTO resource(catid, resdescription, resname, reslocation) VALUES (1, 'bottled water requested, please', 'Bottled Water', 'another address') Returning resid)
    #                 INSERT INTO request(cid, resid)
    #                 VALUES (1, (select resid from rows));'''
    #     cursor.execute(query, (catid, resdescription, resname, reslocation, sid, suprice, suquantity))
    #     reqid = cursor.fetchone()[0]
    #     self.conn.commit()
    #     return suid


