from flask import jsonify

from dao.consumer import ConsumerDAO
from dao.order import OrderDAO
from dao.users import UsersDAO

from handler.supply import SupplyHandler


class OrderHandler:
    def build_order_dict(self, row):
        result = {}
        result['onumber'] = row[0]
        result['cid'] = row[1]
        result['uid'] = row[2]
        result['suid'] = row[3]
        result['sid'] = row[4]
        result['odate_ordered'] = row[5]
        result['oquantity'] = row[6]
        result['odate_delivered'] = row[7]
        return result

    def getAllOrders(self):
        dao = OrderDAO()
        order_list = dao.getAllOrders()
        result_list = []
        for row in order_list:
            result = self.build_order_dict(row)
            result_list.append(result)
        return jsonify(Order=result_list)

    def getOrderById(self, onumber):
        dao = OrderDAO()
        row = dao.getOrdersById(onumber)
        if not row:
            return jsonify(Error="Order Not Found"), 404
        else:
            result = self.build_order_dict(row[0])
        return jsonify(Order=result)

    def getSupplyByOrderId(self, onumber):
        dao = OrderDAO()
        row = dao.getSupplyByOrderId(onumber)
        if not row:
            return jsonify(Error="Order Not Found"), 404
        else:
            result = self.build_order_dict(row[0])
        return jsonify(Supply=result)

    def getOrderByUserId(self, uid):
        dao = OrderDAO()
        row = dao.getOrderByUserId(uid)
        if not row:
            return jsonify(Error="Order Not Found"), 404
        else:
            result = self.build_order_dict(row[0])
        return jsonify(Order=result)


    def searchOrder(self, args):
        odate_ordered = args.get("odate_ordered")
        odate_delivered = args.get("odate_delivered")
        if len(args) == 1 and odate_ordered:
            dao = OrderDAO()
            order_list = dao.getOrderByDateOrdered(odate_ordered)
        elif len(args) == 1 and odate_delivered:
            dao = OrderDAO()
            order_list = dao.getOrderByDateDelivered(odate_delivered)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in order_list:
            result = self.build_order_dict(row)
            result_list.append(result)
        return jsonify(Order=result_list)

    def insertOrderByUserId(self, form):
        if form and (len(form) == 5 or len(form) == 4):
            uid = form['uid']
            suid = form['suid']
            sid = form['sid']
            oquantity = form['oquantity']
            if uid and suid and sid and oquantity:
                check = UsersDAO()
                result = check.getUserById(uid)
                if result:
                    dao = OrderDAO()
                    result = dao.addOrderByUserID(uid, suid, sid, oquantity)
                    if result is not None:
                        return jsonify(Order=result), 201
                    else:
                        return jsonify(ERROR="Order insert failed")
                return jsonify(Error="User ID does not exist."), 400

    def insertOrderByConsumerId(self, form):
        if form and (len(form) == 5 or len(form) == 4):
            cid = form['cid']
            suid = form['suid']
            sid = form['sid']
            oquantity = form['oquantity']
            if cid and suid and sid and oquantity:
                check = ConsumerDAO()
                result = check.getConsumerById(cid)
                if result:
                    dao = OrderDAO()
                    result = dao.addOrderByConsumerID(cid, suid, sid, oquantity)
                    if result is not None:
                        return jsonify(Order=result), 201
                    else:
                        return jsonify(ERROR="Order insert failed")
                return jsonify(Error="User ID does not exist."), 400




