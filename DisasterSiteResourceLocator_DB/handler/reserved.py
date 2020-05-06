from flask import jsonify
from dao.reserved import ReservedDAO

from handler.supply import SupplyHandler


class ReservedHandler:
    def build_reserved_dict(self, row):
        result = {}
        result['rnumber'] = row[0]
        result['cid'] = row[1]
        result['uid'] = row[2]
        result['suid'] = row[3]
        result['sid'] = row[4]
        result['rdate'] = row[5]
        result['rquantity'] = row[6]
        return result

    def getAllReserved(self):
        dao = ReservedDAO
        order_list = dao.getAllReserved()
        result_list = []
        for row in order_list:
            result = self.build_request_dict(row)
            result_list.append(result)
        return jsonify(Order=result)

    def getReservedById(self, rnumber):
        dao = ReservedDAO()
        row = dao.getOrdersById(rnumber)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)

    def getReservedByUserId(self, uid):
        dao = ReservedDAO()
        row = dao.getOrdersById(uid)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)

    def getSupplyByReservedId(self, rnumber):
        dao = ReservedDAO()
        row = dao.getSupplyByReserveID(rnumber)
        if not row:
            return jsonify(Error="Request Not Found"), 404
        else:
            result = self.build_request_dict(row[0])
        return jsonify(Order=result)

    def searchReserved(self, args):
        rdate_ordered = args.get("rdate_ordered")
        rdate_delivered = args.get("rdate_delivered")
        if len(args) == 1 and rdate_ordered:
            dao = ReservedDAO()
            order_list = dao.getOrderByDateOrdered(rdate_ordered)
        if len(args) == 1 and rdate_delivered:
            dao = ReservedDAO()
            order_list = dao.getRequestByCategory(rdate_delivered)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in order_list:
            result = self.build_request_dict(row)
            result_list.append(result)
        return jsonify(Request=result_list)

    def insertReserved(self, form):
        result = self.build_reserved_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Reserved=result), 201

    def deleteReserved(self, rnumber):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateReserved(self, rnumber, form):
        result = self.build_reserved_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Reserved=result), 200


