from flask import Flask, jsonify, request

from handler.administrator import AdministratorHandler
from handler.billinginformation import BillingInformationHandler
from handler.category import CategoryHandler
from handler.consumer import ConsumerHandler
from handler.order import OrderHandler
from handler.request import RequestHandler
from handler.reserved import ReservedHandler
from handler.supplier import SupplierHandler
from handler.supply import SupplyHandler
from handler.users import UsersHandler
# Import Cross-Origin Resource Sharing to enable
# services on other ports on this machine or on other
# machines to access this app
from flask_cors import CORS

# Activate
app = Flask(__name__)
# Apply CORS to this app
CORS(app)


@app.route('/')
def greeting():
    return '''Welcome to Disaster Site Resource Locator Go to /DSRLApp to get started.'''


@app.route('/DSRLApp')
def loginOrSignup():
    print("Welcome to Disaster Site Resource Locator")
    print("1) Log-in")
    print("2) Sign-up")

    typeList = {
        "1": "Administrator",
        "2": "Supplier",
        "3": "Consumer"
    }

    while True:
        choice = input("Do you want to log-in or sign-up?")
        if choice == str(1) or choice == str(2):
            print("What is your user type:")
            print("1) Administrator")
            print("2) Supplier")
            print("3) Consumer")
            while True:
                utype = input("Enter type: ")
                if utype == str(1) or utype == str(2) or utype == str(3):
                    if choice == str(1):
                        uname = input("Enter username: ")
                        upass = input("Enter password: ")
                        form = {
                            "uname": uname,
                            "upass": upass,
                            "utype": typeList[utype]
                        }
                        return UsersHandler().login(form)
                    if choice == str(2):
                        uname = input("Enter username: ")
                        upass = input("Enter password: ")
                        first_name = input("Enter First Name: ")
                        last_name = input("Enter Last Name: ")
                        form = {
                            "uname": uname,
                            "upass": upass,
                            "utype": typeList[utype],
                            "first_name": first_name,
                            "last_name": last_name
                        }
                        return UsersHandler().signup(form)
                    else:
                        print("Invalid value.")
                else:
                    print("Invalid value.")
        else:
            print("Invalid value.")


@app.route('/DSRLApp/users', methods=['GET', 'POST'])
def getAllUsersAvailable():
    if request.method == 'POST':
        return UsersHandler().signup(request.json)
    else:
        if not request.args:
            return UsersHandler().getAllUsers()
        else:
            return UsersHandler().searchUsers(request.args)


@app.route('/DSRLApp/users/<int:uid>', methods=['GET'])
def getUserById(uid):
    if request.method == 'GET':
        return UsersHandler().getUserById(uid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/consumers', methods=['GET'])
def getAllConsumers():
    if not request.args:
        return ConsumerHandler().getAllConsumers()
    else:
        return ConsumerHandler().searchConsumer(request.args)


@app.route('/DSRLApp/consumers/<int:cid>', methods=['GET', 'PUT'])
def getConsumerById(cid):
    if request.method == 'GET':
        return ConsumerHandler().getConsumerById(cid)
    elif request.method == 'PUT':
        if request.json:
            return ConsumerHandler().updateConsumer(cid, request.json)
        else:
            return jsonify(Error="No attributes were provided."), 404
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/suppliers', methods=['GET'])
def getAllSuppliers():
    if not request.args:
        return SupplierHandler().getAllSuppliers()
    else:
        return SupplierHandler().searchSupplier(request.args)


@app.route('/DSRLApp/suppliers/<int:sid>', methods=['GET', 'PUT'])
def getSupplierById(sid):
    if request.method == 'GET':
        return SupplierHandler().getSupplierById(sid)
    elif request.method == 'PUT':
        if request.json:
            return SupplierHandler().updateSupplier(sid, request.json)
        else:
            return jsonify(Error="No attributes were provided."), 404
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/administrators', methods=['GET'])
def getAllAdministrators():
    if not request.args:
        return AdministratorHandler().getAllAdministrators()
    else:
        return jsonify(ERROR="There are no arguments in the administrator table.")


@app.route('/DSRLApp/administrators/<int:aid>', methods=['GET'])
def getAdministratorByAdminId(aid):
    if request.method == 'GET':
        return AdministratorHandler().getAdministratorByAdminId(aid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/supplies', methods=['GET', 'POST'])
def getAllSupplies():
    if request.method == 'POST':
        if request.json:
            return SupplyHandler().insertSupply(request.json)
        else:
            return jsonify(Error="No supply was provided.")
    else:
        if not request.args:
            return SupplyHandler().getAllSuppliesAvailable()
        else:
            return SupplyHandler().searchSupply(request.args)


@app.route('/DSRLApp/supplies/orderedOrReserved', methods=['GET'])
def getAllSuppliesOrderedOrReserved():
    return SupplyHandler().getAllSuppliesOrderedOrReserved()


@app.route('/DSRLApp/supplies/resources', methods=['GET'])
def getAllResourcesAvailable():
    return SupplyHandler().getAllResourcesAvailable()


@app.route('/DSRLApp/supplies/<int:suid>', methods=['GET', 'PUT', 'DELETE'])
def getSupplyById(suid):
    if request.method == 'GET':
        return SupplyHandler().getSupplyById(suid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/supplies/<int:suid>/resource')
def getResourceBySupplyId(suid):
    return SupplyHandler().getResourceBySupplyId(suid)


@app.route('/DSRLApp/requests', methods=['GET', 'POST'])
def getAllRequests():
    if request.method == 'POST':
        if request.json:
            return RequestHandler().insertRequest(request.json)
        else:
            return jsonify(Error="No request was provided.")
    else:
        if not request.args:
            return RequestHandler().getAllRequests()
        else:
            return RequestHandler().searchRequest(request.args)


@app.route('/DSRLApp/requests/resources', methods=['GET'])
def getAllResourcesRequested():
    return RequestHandler().getAllResourcesRequested()


@app.route('/DSRLApp/requests/<int:reqid>', methods=['GET'])
def getRequestById(reqid):
    if request.method == 'GET':
        return RequestHandler().getRequestById(reqid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/requests/<int:reqid>/resource')
def getResourceByRequestId(reqid):
    return RequestHandler().getResourceByRequestId(reqid)


@app.route('/DSRLApp/orders', methods=['GET', 'POST'])
def getAllOrders():
    if request.method == 'POST':
        if request.json:
            for keys in request.json.keys():
                if keys == 'uid':
                    return OrderHandler().insertOrderByUserId(request.json)
                elif keys == 'cid':
                    return OrderHandler().insertOrderByConsumerId(request.json)
        return jsonify(Error="No order was provided.")
    else:
        if not request.args:
            return OrderHandler().getAllOrders()
        else:
            return OrderHandler().searchOrder(request.args)


@app.route('/DSRLApp/orders/<int:onumber>', methods=['GET'])
def getOrderById(onumber):
    if request.method == 'GET':
        return OrderHandler().getOrderById(onumber)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/orders/<int:onumber>/supply')
def getSupplyByOrderId(onumber):
    return OrderHandler().getSupplyByOrderId(onumber)


@app.route('/DSRLApp/reserved', methods=['GET', 'POST'])
def getAllReserved():
    if request.method == 'POST':
        if request.json:
            if request.json['uid']:
                return ReservedHandler().insertReservedByUserId(request.json)
            elif request.json['cid']:
                return ReservedHandler().insertReservedByConsumerId(request.json)
        else:
            return jsonify(Error="No reservation was provided.")
    else:
        if not request.args:
            return ReservedHandler().getAllReserved()
        else:
            return ReservedHandler().searchReserved(request.args)


@app.route('/DSRLApp/reserved/<int:rnumber>', methods=['GET'])
def getReservedById(rnumber):
    if request.method == 'GET':
        return ReservedHandler().getReservedById(rnumber)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/reserved/<int:rnumber>/supply')
def getSupplyByReservedId(rnumber):
    return ReservedHandler().getSupplyByReservedId(rnumber)


@app.route('/DSRLApp/users/billinginformation', methods=['GET', 'POST'])
def getAllBillingInformation():
    if request.method == 'POST':
        if request.json:
            return BillingInformationHandler().insertBillingInformation(request.json)
        else:
            return jsonify(Error="No billing information was provided.")
    else:
        if not request.args:
            return BillingInformationHandler().getAllBillingInformation()
        else:
            return BillingInformationHandler().searchBillingInformation(request.args)


@app.route('/DSRLApp/users/billinginformation/<int:bid>', methods=['GET'])
def getBillingInformationById(bid):
    if request.method == 'GET':
        return BillingInformationHandler().getBillingInformationById(bid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/users/<int:uid>/billinginformation', methods=['GET'])
def getBillingInformationByUserId(uid):
    return BillingInformationHandler().getBillingInformationByUserId(uid)


@app.route('/DSRLApp/users/<int:uid>/orders', methods=['GET'])
def getOrderByUserId(uid):
    return OrderHandler().getOrderByUserId(uid)


@app.route('/DSRLApp/users/<int:uid>/reserved', methods=['GET'])
def getReservedByUserId(uid):
    return ReservedHandler().getReservedByUserId(uid)


@app.route('/DSRLApp/categories', methods=['GET', 'POST'])
def getAllCategories():
    if request.method == 'POST':
        if request.json:
            return CategoryHandler().insertCategory(request.json)
        else:
            return jsonify(Error="No category was provided.")
    else:
        if not request.args:
            return CategoryHandler().getAllCategories()
        else:
            return CategoryHandler().searchCategory(request.args)


@app.route('/DSRLApp/categories/<int:catid>', methods=['GET'])
def getCategoriesById(catid):
    return CategoryHandler().getCategoryById(catid)


if __name__ == '__main__':
    app.run()
