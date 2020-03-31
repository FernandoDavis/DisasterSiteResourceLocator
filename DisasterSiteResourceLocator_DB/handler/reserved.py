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
        result = self.build_reserved_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Reserved=result)

    def getReservedById(self, rnumber):
        result = self.build_reserved_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Reserved=result)

    def getSupplyByReservedId(self, rnumber):
        result = SupplyHandler().getSupplyById(1)
        return result

    def searchReserved(self, args):
        result = self.build_reserved_dict((1, 1, 1, 1, 1, "2020-03-22", 3))
        return jsonify(Reserved=result)

    def insertReserved(self, form):
        result = self.build_reserved_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Reserved=result), 201

    def deleteReserved(self, rnumber):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateReserved(self, rnumber, form):
        result = self.build_reserved_dict((2, 1, 2, 1, 1, "2020-03-22", 5))
        return jsonify(Reserved=result), 200


