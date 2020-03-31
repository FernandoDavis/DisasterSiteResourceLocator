from flask import Flask, jsonify, request

from handler.administrator import AdministratorHandler
from handler.consumer import ConsumerHandler
from handler.request import RequestHandler
from handler.supplier import SupplierHandler
from handler.supply import SupplyHandler
from handler.users import UsersHandler
# Import Cross-Origin Resource Sharing to enable
# services on other ports on this machine or on other
# machines to access this app
from flask_cors import CORS, cross_origin

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


@app.route('/DSRLApp/users/<int:uid>', methods=['GET', 'PUT', 'DELETE'])
def getUserById(uid):
    if request.method == 'GET':
        return UsersHandler().getUserById(uid)
    elif request.method == 'PUT':
        if request.json:
            return UsersHandler().updateUser(uid, request.json)
        else:
            return jsonify(Error="No parameters were given."), 404
    elif request.method == 'DELETE':
        return UsersHandler().deleteUser(uid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/consumers', methods=['GET'])
def getAllConsumers():
    if not request.args:
        return ConsumerHandler().getAllConsumers()
    else:
        return ConsumerHandler().searchConsumer(request.args)


@app.route('/DSRLApp/consumers/<int:cid>', methods=['GET', 'PUT', 'DELETE'])
def getConsumerById(cid):
    if request.method == 'GET':
        return ConsumerHandler().getConsumerById(cid)
    elif request.method == 'PUT':
        if request.json:
            return ConsumerHandler().updateConsumer(cid, request.json)
        else:
            return jsonify(Error="No attributes were provided."), 404
    elif request.method == 'DELETE':
        return ConsumerHandler().deleteConsumer(cid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/suppliers', methods=['GET'])
def getAllSuppliers():
    if not request.args:
        return SupplierHandler().getAllSuppliers()
    else:
        return SupplierHandler().searchSupplier(request.args)


@app.route('/DSRLApp/suppliers/<int:sid>', methods=['GET', 'PUT', 'DELETE'])
def getSupplierById(sid):
    if request.method == 'GET':
        return SupplierHandler().getSupplierById(sid)
    elif request.method == 'PUT':
        if request.json:
            return SupplierHandler().updateSupplier(sid, request.json)
        else:
            return jsonify(Error="No attributes were provided."), 404
    elif request.method == 'DELETE':
        return SupplierHandler().deleteSupplier(sid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/administrators', methods=['GET'])
def getAllAdministrators():
    if not request.args:
        return AdministratorHandler().getAllAdministrators()
    else:
        return AdministratorHandler().searchAdministrator(request.args)


@app.route('/DSRLApp/administrators/<int:aid>', methods=['GET', 'PUT', 'DELETE'])
def getAdministratorById(aid):
    if request.method == 'GET':
        return AdministratorHandler().getAdministratorById(aid)
    elif request.method == 'PUT':
        if request.json:
            return AdministratorHandler().updateAdministrator(aid, request.json)
        else:
            return jsonify(Error="No attributes were provided."), 404
    elif request.method == 'DELETE':
        return AdministratorHandler().deleteAdministrator(aid)
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
            return SupplyHandler().getAllSupplies()
        else:
            return SupplyHandler().searchSupply(request.args)


@app.route('/DSRLApp/supplies/<int:suid>', methods=['GET', 'PUT', 'DELETE'])
def getSupplyById(suid):
    if request.method == 'GET':
        return SupplyHandler().getSupplyById(suid)
    elif request.method == 'PUT':
        if request.json:
            return SupplyHandler().updateSupply(suid, request.args)
        else:
            return jsonify(Error="No attributes were provided."), 404
    elif request.method == 'DELETE':
        return SupplyHandler().deleteSupply(suid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/supplies/<int:suid>/resource')
def getResourceBySupplyId(suid):
    return SupplyHandler().getResourceBySupplyId(suid)

#####################################

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


@app.route('/DSRLApp/requests/<int:reqid>', methods=['GET', 'PUT', 'DELETE'])
def getRequestById(reqid):
    if request.method == 'GET':
        return RequestHandler().getRequestById(reqid)
    elif request.method == 'PUT':
        if request.json:
            return RequestHandler().updateRequest(reqid, request.args)
        else:
            return jsonify(Error="No attributes were provided."), 404
    elif request.method == 'DELETE':
        return RequestHandler().deleteRequest(reqid)
    else:
        return jsonify(Error="Method not allowed."), 405


@app.route('/DSRLApp/requests/<int:reqid>/resource')
def getResourceByRequestId(reqid):
    return RequestHandler().getResourceByRequestId(reqid)


# @app.route('/PartApp/requested', methods=['GET', 'POST'])
# def getAllResourcesRequested():
#     if request.method == 'POST':
#         # cambie a request.json pq el form no estaba bregando
#         # parece q estaba poseido por satanas ...
#         # DEBUG a ver q trae el json q manda el cliente con la nueva pieza
#         print("REQUEST: ", request.json)
#         return PartHandler().insertPartJson(request.json)
#     else:
#         if not request.args:
#             return PartHandler().getAllResourcesRequested()
#         else:
#             return PartHandler().searchParts(request.args)
#
# @app.route('/PartApp/parts', methods=['GET', 'POST'])
# def getAllParts():
#     if request.method == 'POST':
#         # cambie a request.json pq el form no estaba bregando
#         # parece q estaba poseido por satanas ...
#         # DEBUG a ver q trae el json q manda el cliente con la nueva pieza
#         print("REQUEST: ", request.json)
#         return PartHandler().insertPartJson(request.json)
#     else:
#         if not request.args:
#             return PartHandler().getAllParts()
#         else:
#             return PartHandler().searchParts(request.args)
#
# @app.route('/PartApp/parts/<int:pid>', methods=['GET', 'PUT', 'DELETE'])
# def getPartById(pid):
#     if request.method == 'GET':
#         return PartHandler().getPartById(pid)
#     elif request.method == 'PUT':
#         return PartHandler().updatePart(pid, request.form)
#     elif request.method == 'DELETE':
#         return PartHandler().deletePart(pid)
#     else:
#         return jsonify(Error="Method not allowed."), 405
#
# @app.route('/PartApp/parts/<int:pid>/suppliers')
# def getSuppliersByPartId(pid):
#     return PartHandler().getSuppliersByPartId(pid)
#

#
# @app.route('/PartApp/suppliers/<int:sid>',
#            methods=['GET', 'PUT', 'DELETE'])
# def getSupplierById(sid):
#     if request.method == 'GET':
#         return SupplierHandler().getSupplierById(sid)
#     elif request.method == 'PUT':
#         pass
#     elif request.method == 'DELETE':
#         pass
#     else:
#         return jsonify(Error = "Method not allowed"), 405
#
#
# @app.route('/PartApp/suppliers/<int:sid>/parts')
# def getPartsBySuplierId(sid):
#     return SupplierHandler().getPartsBySupplierId(sid)
#
# @app.route('/PartApp/parts/countbypartid')
# def getCountByPartId():
#     return PartHandler().getCountByPartId()

if __name__ == '__main__':
    app.run()
