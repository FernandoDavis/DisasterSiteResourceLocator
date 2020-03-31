from flask import jsonify
from dao.supplier import SupplierDAO


class AdministratorHandler:

    def build_administrator_dict(self, row):
        result = {}
        result['aid'] = row[0]
        result['uid'] = row[1]
        result['uname'] = row[2]
        result['upass'] = row[3]
        result['first_name'] = row[4]
        result['last_name'] = row[5]
        return result

    def getAllAdministrators(self):
        # dao = SupplierDAO()
        # supplier_list = dao.getAllSuppliers()
        # result_list = []
        # for row in supplier_list:
        #     result = self.build_supplier_dict(row)
        #     result_list.append(result)
        # return jsonify(Suppliers=result_list)
        result = self.build_administrator_dict((1, 3, "Grandpa", "password", "Gabriel", "Soto"))
        return jsonify(Administrator=result)

    def getAdministratorById(self, aid):
        # dao = ConsumerDAO()
        # row = dao.getConsumerById(cid)
        # if not row:
        #     return jsonify(Error="User Not Found"), 404
        # else:
        #     result = self.build_consumer_dict(row[0])
        # return jsonify(Consumer=result)
        if aid == 1:
            result = self.build_administrator_dict((1, 3, "Grandpa", "password", "Gabriel", "Soto"))
            return jsonify(Administrator=result)
        else:
            return jsonify(Error="Administrator not found."), 404

    def searchAdministrator(self, args):
        result = self.build_administrator_dict((1, 3, "Pa", "password", "Gabriel", "Soto"))
        return jsonify(Administrator=result)

    def deleteAdministrator(self, aid):
        # Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateAdministrator(self, aid, form):
        result = self.build_administrator_dict((1, 3, "Grandpa", "password", "Gabriel", "Soto"))
        return jsonify(Administrator=result), 200