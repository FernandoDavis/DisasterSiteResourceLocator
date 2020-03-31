from flask import jsonify
from dao.consumer import ConsumerDAO


class ConsumerHandler:

    def build_consumer_dict(self, row):
        result = {}
        result['cid'] = row[0]
        result['uid'] = row[1]
        result['uname'] = row[2]
        result['upass'] = row[3]
        result['first_name'] = row[4]
        result['last_name'] = row[5]
        result['caddress'] = row[6]
        return result

    def getAllConsumers(self):
        # dao = ConsumerDAO()
        # consumer_list = dao.getAllConsumers()
        # result_list = []
        # for row in consumer_list:
        #     result = self.build_consumer_dict(row)
        #     result_list.append(result)
        # return jsonify(Consumer=result_list)
        result = self.build_consumer_dict((1, 1, "Grandad", "password", "Jose", "Tua", "SomeAddress"))
        return jsonify(Consumer=result)


    def getConsumerById(self, cid):
        # dao = ConsumerDAO()
        # row = dao.getConsumerById(cid)
        # if not row:
        #     return jsonify(Error="User Not Found"), 404
        # else:
        #     result = self.build_consumer_dict(row[0])
        # return jsonify(Consumer=result)
        if cid == 1:
            result = self.build_consumer_dict((1, 1, "Grandad", "password", "Jose", "Tua", "SomeAddress"))
            return jsonify(Consumer=result)
        else:
            return jsonify(Error="Consumer not found."), 404

    def searchConsumer(self, args):
        # uname = args.get("uname")
        # first_name = args.get("first_name")
        # last_name = args.get("last_name")
        # caddress = args.get("caddress")
        # if len(args) == 4 and uname and first_name and last_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndFirstAndLastnameAndAddress(uname, first_name, last_name, caddress)
        # elif len(args) == 3 and uname and first_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndFirstnameAndAddress(uname, first_name, caddress)
        # elif len(args) == 3 and uname and last_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndLastnameAndAddress(uname, last_name, caddress)
        # elif len(args) == 3 and first_name and last_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByFirstAndLastnameAndAddress(first_name, last_name, caddress)
        # elif len(args) == 3 and uname and first_name and last_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndFirstAndLastname(uname, first_name, last_name)
        # elif len(args) == 2 and first_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByFirstnameAndAddress(first_name, caddress)
        # elif len(args) == 2 and last_name and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByLastnameAndAddress(last_name, caddress)
        # elif len(args) == 2 and uname and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUsernameAndAddress(uname, caddress)
        # elif len(args) == 2 and uname and first_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndFirstname(uname, first_name)
        # elif len(args) == 2 and uname and last_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUserAndLastname(uname, last_name)
        # elif len(args) == 2 and first_name and last_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByFirstAndLastname(first_name, last_name)
        # elif len(args) == 1 and uname:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByUsername(uname)
        # elif len(args) == 1 and first_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByFirstname(first_name)
        # elif len(args) == 1 and last_name:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByLastname(last_name)
        # elif len(args) == 1 and caddress:
        #     dao = ConsumerDAO()
        #     consumer_list = dao.getConsumerByAddress(caddress)
        # else:
        #     return jsonify(Error="Malformed search string."), 400
        #
        # result_list = []
        # for row in consumer_list:
        #     result = self.build_consumer_dict(row)
        #     result_list.append(result)
        # return jsonify(Consumer=result_list)
        result = self.build_consumer_dict((1, 1, "Dad", "password", "Jose", "Tua", "SomeAddress"))
        return jsonify(Consumer=result)

    def deleteConsumer(self, cid):
        # Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateConsumer(self, cid, form):
        result = self.build_consumer_dict((1, 1, "Grandad", "password", "Jose", "Tua", "SomeAddress"))
        return jsonify(Consumer=result), 200