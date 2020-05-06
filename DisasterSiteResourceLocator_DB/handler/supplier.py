from flask import jsonify
from dao.supplier import SupplierDAO


class SupplierHandler:

    def build_supplier_dict(self, row):
        result = {}
        result['sid'] = row[0]
        result['uid'] = row[1]
        result['uname'] = row[2]
        result['first_name'] = row[3]
        result['last_name'] = row[4]
        result['saddress'] = row[5]
        result['company_name'] = row[6]
        return result

    def getAllSuppliers(self):
        dao = SupplierDAO()
        supplier_list = dao.getAllSuppliers()
        result_list = []
        for row in supplier_list:
            result = self.build_supplier_dict(row)
            result_list.append(result)
        return jsonify(Supplier=result_list)

    def getSupplierById(self, sid):
        dao = SupplierDAO()
        row = dao.getSupplierById(sid)
        if not row:
            return jsonify(Error="Supplier Not Found"), 404
        else:
            result = self.build_supplier_dict(row[0])
        return jsonify(Supplier=result)

    def searchSupplier(self, args):
        uname = args.get("uname")
        first_name = args.get("first_name")
        last_name = args.get("last_name")
        saddress = args.get("saddress")
        company_name = args.get("company_name")
        if len(args) == 5 and uname and first_name and last_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstAndLastnameAndAddressAndCompany(uname, first_name, last_name, saddress, company_name)
        elif len(args) == 4 and uname and first_name and last_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstAndLastnameAndAddress(uname, first_name, last_name, saddress)
        elif len(args) == 4 and uname and first_name and last_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstAndLastnameAndCompany(uname, first_name, last_name, company_name)
        elif len(args) == 4 and uname and first_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstnameAndAddressAndCompany(uname, first_name, saddress, company_name)
        elif len(args) == 4 and uname and last_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndLastnameAndAddressAndCompany(uname, last_name, saddress, company_name)
        elif len(args) == 4 and first_name and last_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstAndLastnameAndAddressAndCompany(first_name, last_name, saddress, company_name)
        elif len(args) == 3 and uname and first_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstnameAndAddress(uname, first_name, saddress)
        elif len(args) == 3 and uname and last_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndLastnameAndAddress(uname, last_name, saddress)
        elif len(args) == 3 and first_name and last_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstAndLastnameAndAddress(first_name, last_name, saddress)
        elif len(args) == 3 and uname and first_name and last_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstAndLastname(uname, first_name, last_name)
        elif len(args) == 3 and uname and first_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstnameAndCompany(uname, first_name, company_name)
        elif len(args) == 3 and uname and last_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndLastnameAndCompany(uname, last_name, company_name)
        elif len(args) == 3 and uname and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndAddressAndCompany(uname, saddress, company_name)
        elif len(args) == 3 and first_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstnameAndAddressAndCompany(first_name, saddress, company_name)
        elif len(args) == 3 and first_name and last_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstAndLastnameAndCompany(first_name, last_name, company_name)
        elif len(args) == 3 and last_name and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByLastnameAndAddressAndCompany(last_name, saddress, company_name)
        elif len(args) == 2 and first_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstnameAndCompany(first_name, company_name)
        elif len(args) == 2 and last_name and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByLastnameAndCompany(last_name, company_name)
        elif len(args) == 2 and uname and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUsernameAndCompany(uname, company_name)
        elif len(args) == 2 and saddress and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByAddressAndCompany(saddress, company_name)
        elif len(args) == 2 and first_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstnameAndAddress(first_name, saddress)
        elif len(args) == 2 and last_name and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByLastnameAndAddress(last_name, saddress)
        elif len(args) == 2 and uname and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUsernameAndAddress(uname, saddress)
        elif len(args) == 2 and uname and first_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndFirstname(uname, first_name)
        elif len(args) == 2 and uname and last_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUserAndLastname(uname, last_name)
        elif len(args) == 2 and first_name and last_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstAndLastname(first_name, last_name)
        elif len(args) == 1 and uname:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByUsername(uname)
        elif len(args) == 1 and first_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByFirstname(first_name)
        elif len(args) == 1 and last_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByLastname(last_name)
        elif len(args) == 1 and saddress:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByAddress(saddress)
        elif len(args) == 1 and company_name:
            dao = SupplierDAO()
            supplier_list = dao.getSupplierByCompany(company_name)
        else:
            return jsonify(Error="Malformed search string."), 400

        result_list = []
        for row in supplier_list:
            result = self.build_supplier_dict(row)
            result_list.append(result)
        return jsonify(Supplier=result_list)

    def deleteSupplier(self, sid):
        #Filler code
        return jsonify(DeleteStatus="OK"), 200

    def updateSupplier(self, sid, form):
        # Filler Code
        result = self.build_supplier_dict((1, 2, "Abuelo", "password", "Fernando", "Davis", "AnAddress"))
        return jsonify(Supplier=result), 200