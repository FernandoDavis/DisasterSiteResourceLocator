from flask import jsonify
from dao.supply import SupplyDAO


class SupplyHandler:
    def build_supply_dict(self, row):
        result = {}
        result['suid'] = row[0]
        result['sid'] = row[1]
        result['is_void'] = row[2]
        result['is_available'] = row[3]
        result['suprice'] = row[4]
        result['sudate'] = row[5]
        result['suquantity'] = row[6]
        result['resid'] = row[7]
        result['catid'] = row[8]
        result['resname'] = row[9]
        result['resdescription'] = row[10]
        result['reslocation'] = row[11]
        return result

    def build_resource_dict(self, row):
        result = {}
        result['resid'] = row[0]
        result['catid'] = row[1]
        result['resname'] = row[2]
        result['resdescription'] = row[3]
        result['reslocation'] = row[4]
        return result

    def getAllSuppliesAvailable(self):
        dao = SupplyDAO()
        supply_list = dao.getAllSuppliesAvailable()
        result_list = []
        for row in supply_list:
            result = self.build_supply_dict(row)
            result_list.append(result)
        return jsonify(Supply=result_list)

    def getAllSuppliesOrderedOrReserved(self):
        dao = SupplyDAO()
        supply_list = dao.getAllSuppliesOrderedOrReserved()
        result_list = []
        for row in supply_list:
            result = self.build_supply_dict(row)
            result_list.append(result)
        return jsonify(Supply=result_list)

    def getAllResourcesAvailable(self):
        dao = SupplyDAO()
        resource_list = dao.getAllResourcesAvailable()
        result_list = []
        for row in resource_list:
            result = self.build_resource_dict(row)
            result_list.append(result)
        return jsonify(Resource=result_list)

    def getSupplyById(self, suid):
        dao = SupplyDAO()
        row = dao.getSupplyById(suid)
        if not row:
            return jsonify(Error="Supply Not Found"), 404
        else:
            result = self.build_supply_dict(row[0])
        return jsonify(Supply=result)

    def getResourceBySupplyId(self, suid):
        dao = SupplyDAO()
        row = dao.getResourceByRequestId(suid)
        if not row:
            return jsonify(Error="Supply Not Found"), 404
        else:
            result = self.build_resource_dict(row[0])
        return jsonify(Supply=result)

    def searchRequest(self, args):
        resname = args.get("resname")
        cattype = args.get("cattype")
        if len(args) == 1 and resname:
            dao = SupplyDAO()
            supply_list = dao.getSupplyByResourceName(resname)
        elif len(args) == 1 and cattype:
            dao = SupplyDAO()
            supply_list = dao.getSupplyByCategory(cattype)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in supply_list:
            result = self.build_supply_dict(row)
            result_list.append(result)
        return jsonify(Supply=result_list)

    def insertSupply(self, form):
        # if form and len(form) == 7:
        #     sid = form['sid']
        #     suprice = form['suprice']
        #     suquantity = form['suquantity']
        #     catid = form['catid']
        #     resdescription = form['resdescription']
        #     resname = form['resname']
        #     reslocation = form['reslocation']
        #     if sid and suprice and suquantity and catid and resdescription and resname and reslocation:
        #         result = self.build_supply_dict((1, sid, 'f', 'f', suprice, "2020-03-22", suquantity, 1, catid, resdescription, resname, reslocation))
        #         return jsonify(Supply=result), 201
        #     else:
        #         return jsonify(Error="Malformed post request")
        # else:
        #     return jsonify(Error="Malformed post request")
        result = self.build_supply_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 10, 1, 1, "Uncooked rice available test", "Uncooked rice", "Por carolina estoy"))
        return jsonify(Supply=result), 201

    def deleteSupply(self, suid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateSupply(self, suid, form):
        result = self.build_supply_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 15, 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Supply=result), 200


