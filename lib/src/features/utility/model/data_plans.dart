
class DataPlans {
    final int id;
    final String billerCode;
    final String name;
    final double defaultCommission;
    final DateTime dateAdded;
    final String country;
    final bool isAirtime;
    final String billerName;
    final String itemCode;
    final String shortName;
    final int fee;
    final bool commissionOnFee;
    final String regExpression;
    final String labelName;
    final int amount;
    final bool isResolvable;
    final String groupName;
    final String categoryName;
    final bool isData;
    final dynamic defaultCommissionOnAmount;
    final dynamic commissionOnFeeOrAmount;
    final String validityPeriod;

    DataPlans({
        required this.id,
        required this.billerCode,
        required this.name,
        required this.defaultCommission,
        required this.dateAdded,
        required this.country,
        required this.isAirtime,
        required this.billerName,
        required this.itemCode,
        required this.shortName,
        required this.fee,
        required this.commissionOnFee,
        required this.regExpression,
        required this.labelName,
        required this.amount,
        required this.isResolvable,
        required this.groupName,
        required this.categoryName,
        required this.isData,
        required this.defaultCommissionOnAmount,
        required this.commissionOnFeeOrAmount,
        required this.validityPeriod,
    });

    factory DataPlans.fromJson(Map<String, dynamic> json) => DataPlans(
        id: json["id"],
        billerCode: json["biller_code"],
        name: json["name"],
        defaultCommission: json["default_commission"].toDouble(),
        dateAdded: DateTime.parse(json["date_added"]),
        country: json["country"],
        isAirtime: json["is_airtime"],
        billerName: json["biller_name"],
        itemCode: json["item_code"],
        shortName: json["short_name"],
        fee: json["fee"],
        commissionOnFee: json["commission_on_fee"],
        regExpression: json["reg_expression"],
        labelName: json["label_name"],
        amount: json["amount"],
        isResolvable: json["is_resolvable"],
        groupName: json["group_name"],
        categoryName: json["category_name"],
        isData: json["is_data"],
        defaultCommissionOnAmount: json["default_commission_on_amount"],
        commissionOnFeeOrAmount: json["commission_on_fee_or_amount"],
        validityPeriod: json["validity_period"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "biller_code": billerCode,
        "name": name,
        "default_commission": defaultCommission,
        "date_added": dateAdded.toIso8601String(),
        "country": country,
        "is_airtime": isAirtime,
        "biller_name": billerName,
        "item_code": itemCode,
        "short_name": shortName,
        "fee": fee,
        "commission_on_fee": commissionOnFee,
        "reg_expression": regExpression,
        "label_name": labelName,
        "amount": amount,
        "is_resolvable": isResolvable,
        "group_name": groupName,
        "category_name": categoryName,
        "is_data": isData,
        "default_commission_on_amount": defaultCommissionOnAmount,
        "commission_on_fee_or_amount": commissionOnFeeOrAmount,
        "validity_period": validityPeriod,
    };
}
