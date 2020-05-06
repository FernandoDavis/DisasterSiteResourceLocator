from flask import jsonify

from dao.administrator import AdministratorDAO


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
        dao = AdministratorDAO()
        supplier_list = dao.getAllAdministrators()
        result_list = []
        for row in supplier_list:
            result = self.build_administrator_dict(row)
            result_list.append(result)
        return jsonify(Administrator=result_list)

    def getAdministratorById(self, aid):
        dao = AdministratorDAO()
        row = dao.getAdministratorById(aid)
        if not row:
            return jsonify(Error="Administrator Not Found"), 404
        else:
            result = self.build_administrator_dict(row[0])
        return jsonify(Administrator=result)

    def searchAdministrator(self, args):
        #Filler code
        result = self.build_administrator_dict((1, 3, "Pa", "password", "Gabriel", "Soto"))
        return jsonify(Administrator=result)

    def deleteAdministrator(self, aid):
        # Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateAdministrator(self, aid, form):
        result = self.build_administrator_dict((1, 3, "Grandpa", "password", "Gabriel", "Soto"))
        return jsonify(Administrator=result), 200