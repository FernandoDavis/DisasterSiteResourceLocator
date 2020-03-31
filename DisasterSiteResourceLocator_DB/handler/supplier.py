from flask import jsonify
from dao.supplier import SupplierDAO


class SupplierHandler:

    def build_supplier_dict(self, row):
        result = {}
        result['sid'] = row[0]
        result['uid'] = row[1]
        result['uname'] = row[2]
        result['first_name'] = row[3]
        result['last_name'] = row[4]
        result['saddress'] = row[5]
        return result

    def getAllSuppliers(self):
        # dao = SupplierDAO()
        # supplier_list = dao.getAllSuppliers()
        # result_list = []
        # for row in supplier_list:
        #     result = self.build_supplier_dict(row)
        #     result_list.append(result)
        # return jsonify(Suppliers=result_list)
        result = self.build_supplier_dict((1, 2, "Abuelo", "password", "Fernando", "Davis", "AnAddress"))
        return jsonify(Supplier=result)

    def getSupplierById(self, sid):
        # dao = ConsumerDAO()
        # row = dao.getConsumerById(cid)
        # if not row:
        #     return jsonify(Error="User Not Found"), 404
        # else:
        #     result = self.build_consumer_dict(row[0])
        # return jsonify(Consumer=result)
        if sid == 1:
            result = self.build_supplier_dict((1, 2, "Abuelo", "password", "Fernando", "Davis", "AnAddress"))
            return jsonify(Supplier=result)
        else:
            return jsonify(Error="User not found."), 404

    def searchSupplier(self, args):
        result = self.build_supplier_dict((1, 2, "Padre", "password", "Fernando", "Davis", "AnAddress"))
        return jsonify(Supplier=result)

    def deleteSupplier(self, sid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateSupplier(self, sid, form):
        result = self.build_supplier_dict((1, 2, "Abuelo", "password", "Fernando", "Davis", "AnAddress"))
        return jsonify(Supplier=result), 200