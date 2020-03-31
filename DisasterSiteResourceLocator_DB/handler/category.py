from flask import jsonify
from dao.category import CategoryDAO


class CategoryHandler:

    def build_category_dict(self, row):
        result = {}
        result['catid'] = row[0]
        result['cattype'] = row[1]
        return result

    def getAllCategories(self):
        # dao = CategoryDAO()
        # category_list = dao.getAllCategories()
        # result_list = []
        # for row in category_list:
        #     result = self.build_category_dict(row)
        #     result_list.append(result)
        # return jsonify(Categories=result_list)
        result_list = []
        result_list.append(self.build_consumer_dict(1, "Water"))
        result_list.append(self.build_consumer_dict(2, "Medications"))
        result_list.append(self.build_consumer_dict(3, "Baby food"))
        result_list.append(self.build_consumer_dict(4, "Canned food"))
        result_list.append(self.build_consumer_dict(5, "Dry food"))
        result_list.append(self.build_consumer_dict(6, "Ice"))
        result_list.append(self.build_consumer_dict(7, "Fuel"))
        result_list.append(self.build_consumer_dict(8, "Medical devices"))
        result_list.append(self.build_consumer_dict(9, "Heavy equipment"))
        result_list.append(self.build_consumer_dict(10, "Tools"))
        result_list.append(self.build_consumer_dict(11, "Clothing"))
        result_list.append(self.build_consumer_dict(12, "Power Generators"))
        result_list.append(self.build_consumer_dict(13, "Batteries"))
        return jsonify(Category=result_list)

    def getCategoryById(self, catid):
        # dao = CategoryDAO()
        # row = dao.getCategoryById(catid)
        # if not row:
        #     return jsonify(Error="Category Not Found"), 404
        # else:
        #     result = self.build_users_dict(row)
        # return jsonify(Categories=result)
        if catid < 13 and catid > 0:
            result_list = []
            result_list.append(self.build_consumer_dict(1, "Water"))
            result_list.append(self.build_consumer_dict(2, "Medications"))
            result_list.append(self.build_consumer_dict(3, "Baby food"))
            result_list.append(self.build_consumer_dict(4, "Canned food"))
            result_list.append(self.build_consumer_dict(5, "Dry food"))
            result_list.append(self.build_consumer_dict(6, "Ice"))
            result_list.append(self.build_consumer_dict(7, "Fuel"))
            result_list.append(self.build_consumer_dict(8, "Medical devices"))
            result_list.append(self.build_consumer_dict(9, "Heavy equipment"))
            result_list.append(self.build_consumer_dict(10, "Tools"))
            result_list.append(self.build_consumer_dict(11, "Clothing"))
            result_list.append(self.build_consumer_dict(12, "Power Generators"))
            result_list.append(self.build_consumer_dict(13, "Batteries"))
            result = result_list[catid]
            return jsonify(Category=result)
        else:
            return jsonify(Error="Category not found."), 404

    def searchCategory(self, args):
        # catid = args.get("catid")
        # cattype = args.get("cattype")
        # dao = CategoryDAO()
        # if len(args) == 2 and catid and cattype:
        #     category_list = dao.getCategoryByIdAndType(catid, cattype)
        # elif len(args) == 1 and catid:
        #    return self.getCategoryById(catid)
        # elif len(args) == 1 and cattype:
        #     category_list = dao.getCategoryByType(cattype)
        # else:
        #     return jsonify(Error="Malformed search string."), 400
        #
        # result_list = []
        # for row in category_list:
        #     result = self.build_category_dict(row)
        #     result_list.append(result)
        # return jsonify(Categories=result_list)
        result = self.build_category_dict((1, "Dry Food"))
        return jsonify(Category=result)

    def deleteCategory(self, catid):
        #Filler code
        if catid > 13:
            return jsonify(DeleteStatus="OK"), 200
        else:
            return jsonify(Error="Deleting essential category."), 400

    def updateCategory(self, catid, form):
        result = self.build_category_dict((1, "Dry Food"))
        return jsonify(Supplier=result), 200