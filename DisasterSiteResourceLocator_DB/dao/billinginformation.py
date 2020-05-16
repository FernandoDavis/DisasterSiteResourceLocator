from config.dbconfig import pg_config
import psycopg2


class BillingInformationDAO:
    def __init__(self):

        connection_url = "dbname=%s user=%s password=%s" % (pg_config['dbname'],
                                                            pg_config['user'],
                                                            pg_config['passwd'])
        self.conn = psycopg2._connect(connection_url)


    def getAllBillingInformation(self):
        cursor = self.conn.cursor()
        query = "select bid, billing_address, paypal_account, uid from billinginformation;"
        cursor.execute(query)
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getBillingInformationById(self, bid):
        cursor = self.conn.cursor()
        query = "select bid, billing_address, paypal_account, uid from billinginformation where bid = %s;"
        cursor.execute(query, (bid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getBillingInformationByUserId(self, uid):
        cursor = self.conn.cursor()
        query = "select bid, billing_address, paypal_account, uid from billinginformation where uid = %s;"
        cursor.execute(query, (uid,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def getBillingInformationByPaypal(self, paypal_account):
        cursor = self.conn.cursor()
        query = "select bid, billing_address, paypal_account, uid from billinginformation where paypal_account = %s;"
        cursor.execute(query, (paypal_account,))
        result = []
        for row in cursor:
            result.append(row)
        return result

    def insertBillingInformation(self, billing_address, paypal_account, uid):
        cursor = self.conn.cursor()
        query = "INSERT INTO billinginformation(billing_address, paypal_account, uid) VALUES (%s, %s, %s) returning bid;"
        cursor.execute(query, (billing_address, paypal_account, uid,))
        bid = cursor.fetchone()
        self.conn.commit()
        return bid
