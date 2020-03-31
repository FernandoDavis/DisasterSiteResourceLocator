from flask import jsonify
from dao.request import RequestDAO


class RequestHandler:
    def build_request_dict(self, row):
        result = {}
        result['reqid'] = row[0]
        result['cid'] = row[1]
        result['is_void'] = row[2]
        result['reqdate'] = row[3]
        result['resid'] = row[4]
        result['catid'] = row[5]
        result['resdescription'] = row[6]
        result['resname'] = row[7]
        result['reslocation'] = row[8]
        return result

    def build_resource_dict(self, row):
        result = {}
        result['resid'] = row[0]
        result['catid'] = row[1]
        result['resdescription'] = row[2]
        result['resname'] = row[3]
        result['reslocation'] = row[4]
        return result

    def getAllRequests(self):
        result = self.build_request_dict((1, 1, 'f', "2020-03-22", 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Request=result)

    def getRequestById(self, reqid):
        result = self.build_request_dict((1, 1, 'f', 'f', 1.5, "2020-03-22", 15, 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Request=result)

    def getResourceByRequestId(self, reqid):
        result = self.build_resource_dict((1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Resource=result)

    def searchRequest(self, args):
        result = self.build_request_dict((1, 1, 'f', "2020-03-22", 1, 1, "Uncooked rice in a container.", "Uncooked rice", "Calle tal"))
        return jsonify(Request=result)

    def insertRequest(self, form):
        result = self.build_request_dict((1, 1, 'f', "2020-03-22", 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Request=result), 201

    def deleteRequest(self, reqid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateRequest(self, reqid, form):
        result = self.build_request_dict((1, 1, 'f', "2020-03-22", 1, 1, "Uncooked rice unopened and available.", "Uncooked rice", "Calle tal"))
        return jsonify(Request=result), 200


