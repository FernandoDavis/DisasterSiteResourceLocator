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
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where rnumber = %s"
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
        query = "SELECT suid, sid, resid, is_void, is_available, suprice, sudate, suquantity FROM reservation NATURAL INNER JOIN supply where rnumber = %s"
        cursor.execute(query, (rnumber,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedByDateReserved(self, rdate_reserved):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where rdate_reserved = %s"
        cursor.execute(query, (dt.datetime.strptime(rdate_reserved, "%Y-%m-%d"),))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getReservedByDateDelivered(self, rdate_delivered):
        cursor = self.conn.cursor()
        query = "SELECT rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered FROM reservation where rdate_delivered = %s"
        cursor.execute(query, (dt.datetime.strptime(rdate_delivered, "%Y-%m-%d"),))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addReservedByUserID(self, rquantity, uid, suid, sid):
        if uid:
            cursor = self.conn.cursor()
            query = '''with uid_table as (select cid from consumer where uid = %s) 
                        INSERT INTO reservation(rquantity, cid, uid, suid, sid) 
                        VALUES (%s, (select * from uid_table), %s, %s, %s);'''
            cursor.execute(query, (uid, rquantity, uid, suid, sid))
            rnumber = cursor.fetchone()
            self.conn.commit()
            return rnumber
        return None

    def addReservedByConsumerID(self, rquantity, cid, suid, sid):
        if cid:
            cursor = self.conn.cursor()
            query = '''with cid_table as (select uid from consumer where cid = %s) 
                        INSERT INTO reservation(rquantity, cid, uid, suid, sid) 
                        VALUES (%s, %s, (select * from cid_table), %s, %s);'''
            cursor.execute(query, (cid, rquantity, cid, suid, sid))
            rnumber = cursor.fetchone()
            self.conn.commit()
            return rnumber
        return None



