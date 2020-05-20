from flask import jsonify
from dao.order import OrderDAO

from handler.supply import SupplyHandler


class OrderHandler:
    def build_order_dict(self, row):
        result = {}
        result['onumber'] = row[0]
        result['cid'] = row[1]
        result['uid'] = row[2]
        result['suid'] = row[3]
        result['sid'] = row[4]
        result['odate'] = row[5]
        result['oquantity'] = row[6]
        return result

    def getAllOrders(self):
        dao = OrderDAO
        order_list = dao.getAllOrders()
        result_list = []
        for row in order_list:
            result = self.build_request_dict(row)
            result_list.append(result)
        return jsonify(Order=result)

    def getOrderById(self, onumber):
        dao = OrderDAO()
        row = dao.getOrdersById(onumber)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)

    def getSupplyByOrderId(self, onumber):
        dao = OrderDAO()
        row = dao.getSupplyByOrderId(onumber)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)

    def getOrderByUserId(self, uid):
        dao = OrderDAO()
        row = dao.getOrderByUserId(uid)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)


    def searchOrder(self, args):
        odate_ordered = args.get("odate_ordered")
        odate_delivered = args.get("odate_delivered")
        if len(args) == 1 and odate_ordered:
            dao = OrderDAO()
            order_list = dao.getOrderByDateOrdered(odate_ordered)
        if len(args) == 1 and odate_delivered:
            dao = OrderDAO()
            order_list = dao.getRequestByCategory(odate_delivered)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in order_list:
            result = self.build_request_dict(row)
            result_list.append(result)
        return jsonify(Request=result_list)

    def insertOrderByUserId(self, uid, suid, sid, oquantity):
        dao = OrderDAO
        result = dao.addOrderByUserID(uid, suid, sid, oquantity)
        if result is not None:
            return jsonify(Order=result), 201
        return jsonify(Error="User ID does not exist."), 400

    def insertOrderByConsumerId(self, cid, suid, sid, oquantity):
        dao = OrderDAO
        result = dao.addOrderByConsumerID(cid, suid, sid, oquantity)
        if result is not None:
            return jsonify(Order=result), 201
        return jsonify(Error="User ID does not exist."), 400

    def deleteOrder(self, onumber):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateOrder(self, onumber, form):
        result = self.build_order_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Order=result), 200


