from flask import Flask, jsonify, request
from handler.request import RequestHandler
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
    value = '''Welcome to Disaster Site Resource Locator\n
             Go to DSRLApp to get started.'''
    return value


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
        print("REQUEST: ", request.json)
        return UsersHandler().signup(request.json)
    else:
        if not request.args:
            return UsersHandler().getAllUsers()
        else:
            return UsersHandler().searchUsers(request.args)


# @app.route('/PartApp/available', methods=['GET', 'POST'])
# def getAllResourcesAvailable():
#     if request.method == 'POST':
#         # cambie a request.json pq el form no estaba bregando
#         # parece q estaba poseido por satanas ...
#         # DEBUG a ver q trae el json q manda el cliente con la nueva pieza
#         print("REQUEST: ", request.json)
#         return PartHandler().insertPartJson(request.json)
#     else:
#         if not request.args:
#             return PartHandler().getAllResourcesAvailable()
#         else:
#             return PartHandler().searchParts(request.args)
#
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
# @app.route('/PartApp/suppliers', methods=['GET', 'POST'])
# def getAllSuppliers():
#     if request.method == 'POST':
#         return SupplierHandler().insertSupplier(request.form)
#     else :
#         if not request.args:
#             return SupplierHandler().getAllSuppliers()
#         else:
#             return SupplierHandler().searchSuppliers(request.args)
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
