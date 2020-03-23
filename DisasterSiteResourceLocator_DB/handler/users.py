from flask import jsonify
from dao.users import UsersDAO


class UsersHandler:
    def login(self, form):
        if form and len(form) == 3:
            uname = form['uname']
            upass = form['upass']
            utype = form['utype']
            if uname and upass and utype:
                dao = UsersDAO()
                result = dao.confirmUser(uname, upass, utype)
                if isinstance(result, int):
                    return "Log-in successful.", 201
                else:
                    return "Log-in unsuccessful. User or password did not match.", 404
            else:
                return "Log-in unsuccessful. User or password did not match.", 404
        else:
            return "Log-in unsuccessful. User or password did not match.", 404

    def signup(self, form):
        if form and len(form) == 3:
            uname = form['uname']
            upass = form['upass']
            utype = form['utype']
            if uname and upass and utype:
                dao = UsersDAO()
                result = dao.addUser(uname, upass, utype)
                if result:
                    return "Log-in successful.", 201
                else:
                    return jsonify(Error="Malformed post request")
            else:
                return jsonify(Error="Malformed post request")
        else:
            return jsonify(Error="Malformed post request")

    # def insertSupplier(self, form):
    #     if form and len(form) == 3:
    #         sname = form['sname']
    #         scity = form['scity']
    #         sphone = form['sphone']
    #         if sname and scity and sphone:
    #             dao = SupplierDAO()
    #             sid = dao.insert(sname, scity, sphone)
    #             result = {}
    #             result["sid"] = sid
    #             result["sname"] = sname
    #             result["scity"] = scity
    #             result["sphone"] = sphone
    #             return jsonify(Supplier=result), 201
    #         else:
    #             return jsonify(Error="Malformed post request")
    #     else:
    #         return jsonify(Error="Malformed post request")