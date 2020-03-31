from flask import jsonify
from dao.billinginformation import BillingInformationDAO


class BillingInformationHandler:
    def build_billing_information_dict(self, row):
        result = {}
        result['bid'] = row[0]
        result['billing_address'] = row[1]
        result['paypal_account'] = row[2]
        result['uid'] = row[3]
        return result

    def getAllBillingInformation(self):
        result = self.build_billing_information_dict((1, "Some address", "account@domain.com", 1))
        return jsonify(BillingInformation=result)

    def getBillingInformationById(self, bid):
        result = self.build_billing_information_dict((1, "Some address", "account@domain.com", 1))
        return jsonify(BillingInformation=result)

    def getBillingInformationByUserId(self, uid):
        result = self.build_billing_information_dict((1, "Some address", "account@domain.com", 1))
        return jsonify(BillingInformation=result)

    def searchBillingInformation(self, args):
        result = self.build_billing_information_dict((1, "The address", "account@domain.com", 1))
        return jsonify(BillingInformation=result)

    def insertBillingInformation(self, form):
        result = self.build_billing_information_dict((1, "Another address", "account@domain.com", 1))
        return jsonify(BillingInformation=result), 201

    def deleteBillingInformation(self, bid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateBillingInformation(self, bid, form):
        result = self.build_billing_information_dict((1, "Some address", "account@domain.com", 1))
        return jsonify(BillingInformation=result), 200


