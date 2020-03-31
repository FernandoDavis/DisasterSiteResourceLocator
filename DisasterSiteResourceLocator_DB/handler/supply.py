from flask import jsonify
from dao.supply import SupplyDAO


class SupplyHandler:
    def build_supply_dict(self, row):
        result = {}
        result['suid'] = row[0]
        result['sid'] = row[1]
        result['is_void'] = row[2]
        result['is_reserved'] = row[3]
        result['suprice'] = row[4]
        result['sudate'] = row[5]
        result['suquantity'] = row[6]
        result['resid'] = row[7]
        result['catid'] = row[8]
        result['resdescription'] = row[9]
        result['resname'] = row[10]
        result['reslocation'] = row[11]
        return result

    def build_resource_dict(self, row):
        result = {}
        result['resid'] = row[0]
        result['catid'] = row[1]
        result['resdescription'] = row[2]
        result['resname'] = row[3]
        result['reslocation'] = row[4]
        return result

    def getAllSupplies(self):
        result = self.build_supply_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 15, 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Supply=result)

    def getSupplyById(self, suid):
        result = self.build_supply_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 15, 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Supply=result)

    def getResourceBySupplyId(self, suid):
        result = self.build_resource_dict((1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Resource=result)

    def searchSupply(self, args):
        result = self.build_supply_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 15, 1, 1, "Uncooked rice in a container.", "Uncooked rice", "Calle tal"))
        return jsonify(Supply=result)

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


