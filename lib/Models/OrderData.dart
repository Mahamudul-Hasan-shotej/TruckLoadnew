// To parse this JSON data, do
//
//     final orderData = orderDataFromJson(jsonString);

import 'dart:convert';

OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

String orderDataToJson(OrderData data) => json.encode(data.toJson());

class OrderData {
    OrderData({
        this.data,
        this.isExecuted,
    });

    List<Datum> data;
    bool isExecuted;

    factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        isExecuted: json["isExecuted"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isExecuted": isExecuted,
    };
}

class Datum {
    Datum({
        this.createdAt,
        this.information,
        this.createdDate,
        this.sk,
        this.orientation,
        this.orderId,
        this.pk,
    });

    int createdAt;
    List<Information> information;
    DateTime createdDate;
    String sk;
    String orientation;
    String orderId;
    String pk;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: json["created_at"],
        information: List<Information>.from(json["information"].map((x) => Information.fromJson(x))),
        createdDate: DateTime.parse(json["created_date"]),
        sk: json["sk"],
        orientation: json["orientation"],
        orderId: json["order_id"],
        pk: json["pk"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "information": List<dynamic>.from(information.map((x) => x.toJson())),
        "created_date": createdDate.toIso8601String(),
        "sk": sk,
        "orientation": orientation,
        "order_id": orderId,
        "pk": pk,
    };
}

class Information {
    Information({
        this.tripId,
        this.orientation,
        this.truckLoadingPoint,
        this.truckUnloadingPoint,
        this.rentTime,
        this.truckReg,
        this.vendorId,
        this.sk,
        this.updatedBy,
        this.pk,
        this.prevRentStatus,
        this.previousStatus,
        this.orderId,
        this.status,
    });

    String tripId;
    String orientation;
    String truckLoadingPoint;
    String truckUnloadingPoint;
    DateTime rentTime;
    String truckReg;
    String vendorId;
    String sk;
    String updatedBy;
    String pk;
    String prevRentStatus;
    String previousStatus;
    String orderId;
    String status;

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        tripId: json["trip_id"],
        orientation: json["orientation"],
        truckLoadingPoint: json["truck_loading_point"],
        truckUnloadingPoint: json["truck_unloading_point"],
        rentTime: DateTime.parse(json["rent_time"]),
        truckReg: json["truck_reg"],
        vendorId: json["vendor_id"],
        sk: json["sk"],
        updatedBy: json["updated_by"],
        pk: json["pk"],
        prevRentStatus: json["prev_rent_status"],
        previousStatus: json["previous_status"],
        orderId: json["order_id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "trip_id": tripId,
        "orientation": orientation,
        "truck_loading_point": truckLoadingPoint,
        "truck_unloading_point": truckUnloadingPoint,
        "rent_time": rentTime.toIso8601String(),
        "truck_reg": truckReg,
        "vendor_id": vendorId,
        "sk": sk,
        "updated_by": updatedBy,
        "pk": pk,
        "prev_rent_status": prevRentStatus,
        "previous_status": previousStatus,
        "order_id": orderId,
        "status": status,
    };
}
