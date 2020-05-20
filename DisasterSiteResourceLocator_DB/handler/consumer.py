from flask import jsonify
from dao.consumer import ConsumerDAO
from dao.users import UsersDAO


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
        dao = ConsumerDAO()
        consumer_list = dao.getAllConsumers()
        result_list = []
        for row in consumer_list:
            result = self.build_consumer_dict(row)
            result_list.append(result)
        return jsonify(Consumer=result_list)

    def getConsumerById(self, cid):
        dao = ConsumerDAO()
        row = dao.getConsumerById(cid)
        if not row:
            return jsonify(Error="Consumer Not Found"), 404
        else:
            result = self.build_consumer_dict(row[0])
        return jsonify(Consumer=result)

    def searchConsumer(self, args):
        uname = args.get("uname")
        first_name = args.get("first_name")
        last_name = args.get("last_name")
        caddress = args.get("caddress")
        if len(args) == 4 and uname and first_name and last_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndFirstAndLastnameAndAddress(uname, first_name, last_name, caddress)
        elif len(args) == 3 and uname and first_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndFirstnameAndAddress(uname, first_name, caddress)
        elif len(args) == 3 and uname and last_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndLastnameAndAddress(uname, last_name, caddress)
        elif len(args) == 3 and first_name and last_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByFirstAndLastnameAndAddress(first_name, last_name, caddress)
        elif len(args) == 3 and uname and first_name and last_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndFirstAndLastname(uname, first_name, last_name)
        elif len(args) == 2 and first_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByFirstnameAndAddress(first_name, caddress)
        elif len(args) == 2 and last_name and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByLastnameAndAddress(last_name, caddress)
        elif len(args) == 2 and uname and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUsernameAndAddress(uname, caddress)
        elif len(args) == 2 and uname and first_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndFirstname(uname, first_name)
        elif len(args) == 2 and uname and last_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUserAndLastname(uname, last_name)
        elif len(args) == 2 and first_name and last_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByFirstAndLastname(first_name, last_name)
        elif len(args) == 1 and uname:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByUsername(uname)
        elif len(args) == 1 and first_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByFirstname(first_name)
        elif len(args) == 1 and last_name:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByLastname(last_name)
        elif len(args) == 1 and caddress:
            dao = ConsumerDAO()
            consumer_list = dao.getConsumerByAddress(caddress)
        else:
            return jsonify(Error="Malformed search string."), 400

        result_list = []
        for row in consumer_list:
            result = self.build_consumer_dict(row)
            result_list.append(result)
        return jsonify(Consumer=result_list)

    def updateConsumer(self, cid, form):
        dao = ConsumerDAO()
        try:
            if form and len(form) == 1:
                caddress = form['caddress']
                result = dao.updateConsumer(cid, caddress)
                if result:
                    return jsonify(Supplier=[cid, caddress]), 200
            return jsonify(ERROR="Failed to update consumer"), 400
        except:
            return jsonify(ERROR="Failed to update consumer")

    def insertConsumer(self, uid):
        try:
            dao = ConsumerDAO()
            check = UsersDAO()
            result = check.getUserById(uid)
            if result is not None:
                result = dao.addConsumer(uid)
                return jsonify(ConsumerId=result), 201
            else:
                return jsonify(Error="User ID does not exist."), 400
        except:
            return jsonify(ERROR="Failed to insert consumer")