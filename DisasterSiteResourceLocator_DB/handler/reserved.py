from flask import jsonify
from dao.reserved import ReservedDAO
from dao.users import UsersDAO
from dao.consumer import ConsumerDAO
from handler.supply import SupplyHandler


class ReservedHandler:
    def build_reserved_dict(self, row):
        result = {}
        result['rnumber'] = row[0]
        result['rdate_reserved'] = row[1]
        result['rquantity'] = row[2]
        result['cid'] = row[3]
        result['uid'] = row[4]
        result['suid'] = row[5]
        result['sid'] = row[6]
        result['rdate_delivered'] = row[7]
        return result

    def getAllReserved(self):
        dao = ReservedDAO()
        order_list = dao.getAllReserved()
        result_list = []
        for row in order_list:
            result = self.build_reserved_dict(row)
            result_list.append(result)
        return jsonify(Order=result_list)

    def getReservedById(self, rnumber):
        dao = ReservedDAO()
        row = dao.getReservedById(rnumber)
        if not row:
            return jsonify(Error="Reservation Not Found"), 404
        else:
            result = self.build_reserved_dict(row[0])
        return jsonify(Reserved=result)

    def getReservedByUserId(self, uid):
        dao = ReservedDAO()
        row = dao.getReservedById(uid)
        if not row:
            return jsonify(Error="Reservation Not Found"), 404
        else:
            result = self.build_reserved_dict(row[0])
        return jsonify(Reserved=result)

    def getSupplyByReservedId(self, rnumber):
        dao = ReservedDAO()
        row = dao.getSupplyByReserveID(rnumber)
        if not row:
            return jsonify(Error="Reservation Not Found"), 404
        else:
            result = self.build_reserved_dict(row[0])
        return jsonify(Supply=result)

    def searchReserved(self, args):
        rdate_reserved = args.get("rdate_reserved")
        rdate_delivered = args.get("rdate_delivered")
        if len(args) == 1 and rdate_reserved:
            dao = ReservedDAO()
            order_list = dao.getReservedByDateReserved(rdate_reserved)
        elif len(args) == 1 and rdate_delivered:
            dao = ReservedDAO()
            order_list = dao.getReservedByDateDelivered(rdate_delivered)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in order_list:
            result = self.build_reserved_dict(row)
            result_list.append(result)
        return jsonify(Reserved=result_list)

    def insertReservedByUserId(self, form):
        if form and (len(form) == 5 or len(form) == 4):
            uid = form['uid']
            suid = form['suid']
            sid = form['sid']
            rquantity = form['rquantity']
            if uid and suid and sid and rquantity:
                check = UsersDAO()
                result = check.getUserById(uid)
                if result:
                    dao = ReservedDAO()
                    result = dao.addReservedByUserID(rquantity, uid, suid, sid)
                    if result is not None:
                        return jsonify(Reserved=result), 201
                    else:
                        return jsonify(ERROR="Reservation insert failed")
                return jsonify(Error="User ID does not exist."), 400

    def insertReservedByConsumerId(self, form):
        if form and (len(form) == 5 or len(form) == 4):
            cid = form['cid']
            suid = form['suid']
            sid = form['sid']
            rquantity = form['rquantity']
            if cid and suid and sid and rquantity:
                check = ConsumerDAO()
                result = check.getConsumerById(cid)
                if result:
                    dao = ReservedDAO()
                    result = dao.addReservedByConsumerID(rquantity, cid, suid, sid)
                    if result is not None:
                        return jsonify(Reserved=result), 201
                    else:
                        return jsonify(ERROR="Reservation insert failed")
                return jsonify(Error="User ID does not exist."), 400



