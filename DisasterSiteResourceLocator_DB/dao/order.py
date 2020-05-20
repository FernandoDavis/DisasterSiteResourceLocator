from config.dbconfig import pg_config
import datetime as dt
import psycopg2


class OrderDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)

    def getAllOrders(self):
        cursor = self.conn.cursor()
        query = "SELECT onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered FROM \"order\""
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getOrdersById(self, onumber):
        cursor = self.conn.cursor()
        query = "SELECT onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered FROM \"order\" where onumber = %s"
        cursor.execute(query, (onumber,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getOrderByUserId(self, uid):
        cursor = self.conn.cursor()
        query = "SELECT onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered FROM \"order\" where uid = %s"
        cursor.execute(query, (uid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getSupplyByOrderId(self, onumber):
        cursor = self.conn.cursor()
        query = "SELECT suid, sid, resid, is_void, is_available, suprice, sudate, suquantity FROM \"order\" NATURAL INNER JOIN supply where onumber = %s"
        cursor.execute(query, (onumber,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getOrderByDateOrdered(self, odate_ordered):
        cursor = self.conn.cursor()
        query = "SELECT onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered FROM \"order\" where odate_ordered = %s"
        cursor.execute(query, (dt.datetime.strptime(odate_ordered, "%Y-%m-%d"),))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getOrderByDateDelivered(self, odate_delivered):
        cursor = self.conn.cursor()
        query = "SELECT onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered FROM \"order\" where odate_delivered = %s"
        cursor.execute(query, (dt.datetime.strptime(odate_delivered, "%Y-%m-%d"),))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def addOrderByUserID(self, uid, suid, sid, oquantity):
        if uid:
            cursor = self.conn.cursor()
            query = '''with uid_table as (select cid from consumer where uid = %s) 
                        INSERT INTO \"order\"(cid, uid, suid, sid, oquantity) 
                        VALUES ((select * from uid_table), %s, %s, %s, %s) returning onumber;'''
            cursor.execute(query, (uid, uid, suid, sid, oquantity))
            onumber = cursor.fetchone()
            self.conn.commit()
            return onumber
        return None


    def addOrderByConsumerID(self, cid, suid, sid, oquantity):
        if cid:
            cursor = self.conn.cursor()
            query = '''with cid_table as (select uid from consumer where cid = %s) 
                        INSERT INTO \"order\"(cid, uid, suid, sid, oquantity) 
                        VALUES (%s, (select * from cid_table), %s, %s, %s) returning onumber;'''
            cursor.execute(query, (cid, cid, suid, sid, oquantity))
            onumber = cursor.fetchone()
            self.conn.commit()
            return onumber
        return None