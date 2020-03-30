from flask import jsonify
from dao.supplier import SupplierDAO


class SupplierHandler:

    def build_supplier_dict(self, row):
        result = {}
        result['sid'] = row[0]
        result['uaddress'] = row[1]
        result['uid'] = row[2]
        return result

    def getAllSuppliers(self):
        dao = SupplierDAO()
        supplier_list = dao.getAllSuppliers()
        result_list = []
        for row in supplier_list:
            result = self.build_supplier_dict(row)
            result_list.append(result)
        return jsonify(Suppliers=result_list)

    # def getSupplierById(self, uid):
    #     dao = UsersDAO()
    #     row = dao.getUserById(uid)
    #     if not row:
    #         return jsonify(Error="User Not Found"), 404
    #     else:
    #         part = self.build_supplier_dict(row)
    #     return jsonify(Part=part)
    #
    # def searchUsers(self, args):
    #     uname = args.get("uname")
    #     first_name = args.get("first_name")
    #     last_name = args.get("last_name")
    #     dao = UsersDAO()
    #     user_list = []
    #     if len(args) == 3 and uname and first_name and last_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByUserAndFirstAndLastname(uname, first_name, last_name)
    #     elif len(args) == 2 and uname and first_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByUserAndFirstname(uname, first_name)
    #     elif len(args) == 2 and uname and last_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByUserAndLastname(uname, last_name)
    #     elif len(args) == 2 and first_name and last_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByFirstAndLastname(first_name, last_name)
    #     elif len(args) == 1 and uname:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByUsername(uname)
    #     elif len(args) == 1 and first_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByFirstname(first_name)
    #     elif len(args) == 1 and last_name:
    #         dao = UsersDAO()
    #         user_list = dao.getUserByLastname(last_name)
    #     else:
    #         return jsonify(Error="Malformed search string."), 400
    #
    #     result_list = []
    #     for row in user_list:
    #         result = self.build_users_dict(row)
    #         result_list.append(result)
    #     return jsonify(Users=result_list)