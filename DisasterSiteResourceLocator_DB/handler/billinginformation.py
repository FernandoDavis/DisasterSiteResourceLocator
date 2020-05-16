from flask import jsonify
from dao.billinginformation import BillingInformationDAO
from dao.users import UsersDAO


class BillingInformationHandler:
    def build_billing_information_dict(self, row):
        result = {}
        result['bid'] = row[0]
        result['billing_address'] = row[1]
        result['paypal_account'] = row[2]
        result['uid'] = row[3]
        return result

    def getAllBillingInformation(self):
        dao = BillingInformationDAO()
        billing_information_list = dao.getAllBillingInformation()
        result_list = []
        for row in billing_information_list:
            result = self.build_billing_information_dict(row)
            result_list.append(result)
        return jsonify(BillingInformation=result_list)

    def getBillingInformationById(self, bid):
        dao = BillingInformationDAO()
        billing_information_list = dao.getBillingInformationById(bid)
        result_list = []
        for row in billing_information_list:
            result = self.build_billing_information_dict(row)
            result_list.append(result)
        return jsonify(BillingInformation=result_list)

    def getBillingInformationByUserId(self, uid):
        dao = BillingInformationDAO()
        billing_information_list = dao.getBillingInformationByUserId(uid)
        result_list = []
        for row in billing_information_list:
            result = self.build_billing_information_dict(row)
            result_list.append(result)
        return jsonify(BillingInformation=result_list)

    def searchBillingInformation(self, args):
        paypal_account = args.get("paypal_account")
        if len(args) == 1 and paypal_account:
            dao = BillingInformationDAO()
            billing_information_list = dao.getBillingInformationByPaypal(paypal_account)
        else:
            return jsonify(Error="Malformed search string."), 400
        result_list = []
        for row in billing_information_list:
            result = self.build_billing_information_dict(row)
            result_list.append(result)
        return jsonify(Request=result_list)

    def insertBillingInformation(self, billing_address, paypal_account, uid):
        dao = BillingInformationDAO
        check = UsersDAO
        row = check.getUserById()
        if not row:
            return jsonify(Error = "User ID must be belong to an existing user."), 400
        else:
            result = dao.insertBillingInformation(billing_address, paypal_account, uid)
            return jsonify(BillingInformation=result), 201

    def deleteBillingInformation(self, bid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateBillingInformation(self, bid, form):
        # Filler Code
        result = self.build_billing_information_dict((1, "Some address", "account@domain.com", 1))
        return jsonify(BillingInformation=result), 200


