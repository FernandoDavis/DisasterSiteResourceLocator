from config.dbconfig import pg_config
import psycopg2
import datetime as dt

class ReservedDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllReserved(self):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedById(self, rnumber):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where = %s"
        cursor.execute(query, (rnumber,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedByUserId(self, uid):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where uid = %s"
        cursor.execute(query, (uid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyByReserveID(self, rnumber):
        cursor = self.conn.cursor()
        query = "SELECT suid, sid, resid, is_void, is_reserved, suprice, sudate, suquantity FROM reservation NATURAL INNER JOIN supply where rnumber = %s"
        cursor.execute(query, (rnumber,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedByDateOrdered(self, rdate_ordered):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where rdate_reserved = %s"
        cursor.execute(query, (dt.date(rdate_ordered),))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedByDateDelivered(self, rdate_delivered):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where rdate_delivered = %s"
        cursor.execute(query, (dt.date(rdate_delivered),))
        result = []
        for row in cursor:
            result.append(row)
        return result

