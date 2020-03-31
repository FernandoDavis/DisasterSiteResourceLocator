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
        result = self.build_order_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Order=result)

    def getOrderById(self, onumber):
        result = self.build_order_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Order=result)

    def getSupplyByOrderId(self, onumber):
        result = SupplyHandler().getSupplyById(1)
        return result

    def searchOrder(self, args):
        result = self.build_order_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Order=result)

    def insertOrder(self, form):
        result = self.build_order_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Order=result), 201

    def deleteOrder(self, onumber):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateOrder(self, onumber, form):
        result = self.build_order_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Order=result), 200


