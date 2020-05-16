from flask import jsonify
from dao.category import CategoryDAO


class CategoryHandler:

    def build_category_dict(self, row):
        result = {}
        result['catid'] = row[0]
        result['cattype'] = row[1]
        return result

    def getAllCategories(self):
        dao = CategoryDAO()
        category_list = dao.getAllCategories()
        result_list = []
        for row in category_list:
            result = self.build_category_dict(row)
            result_list.append(result)
        return jsonify(Categories=result_list)


    def getCategoryById(self, catid):
        dao = CategoryDAO()
        row = dao.getCategoryById(catid)
        if not row:
            return jsonify(Error="Category Not Found"), 404
        else:
            result = self.build_category_dict(row)
        return jsonify(Categories=result)


    def searchCategory(self, args):
        cattype = args.get("cattype")
        dao = CategoryDAO()
        if len(args) == 1 and cattype:
            category_list = dao.getCategoryByType(cattype)
        else:
            return jsonify(Error="Malformed search string."), 400

        result_list = []
        for row in category_list:
            result = self.build_category_dict(row)
            result_list.append(result)
        return jsonify(Categories=result_list)

    def deleteCategory(self, catid):
        #Filler code
        if catid > 13:
            return jsonify(DeleteStatus="OK"), 200
        else:
            return jsonify(Error="Deleting essential category."), 400

    def updateCategory(self, catid, form):
        #Filler Code
        result = self.build_category_dict((1, "Dry Food"))
        return jsonify(Supplier=result), 200

    def insertCategory(self, cattype):
        dao = CategoryDAO
        row = dao.getCategoryByType(cattype)
        if not row:
            result = dao.addCategory(cattype)
            return jsonify(Categories=result), 201
        else:
            return jsonify(Error="Category type already exists."), 400