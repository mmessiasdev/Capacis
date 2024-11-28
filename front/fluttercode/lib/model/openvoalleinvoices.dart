class OpenVoalleInvoices {
  bool? success;
  Null? messages;
  List<Response>? response;
  String? dataResponseType;
  Null? elapsedTime;

  OpenVoalleInvoices(
      {this.success,
      this.messages,
      this.response,
      this.dataResponseType,
      this.elapsedTime});

  OpenVoalleInvoices.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messages = json['messages'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
    dataResponseType = json['dataResponseType'];
    elapsedTime = json['elapsedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['messages'] = this.messages;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['dataResponseType'] = this.dataResponseType;
    data['elapsedTime'] = this.elapsedTime;
    return data;
  }
}

class Response {
  int? id;
  int? contractNumber;
  Bank? bank;
  Billet? billet;
  Client? client;
  CollectionType? collectionType;
  Client? companyPlace;

  Response(
      {this.id,
      this.contractNumber,
      this.bank,
      this.billet,
      this.client,
      this.collectionType,
      this.companyPlace});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractNumber = json['contractNumber'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    billet =
        json['billet'] != null ? new Billet.fromJson(json['billet']) : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    collectionType = json['collectionType'] != null
        ? new CollectionType.fromJson(json['collectionType'])
        : null;
    companyPlace = json['companyPlace'] != null
        ? new Client.fromJson(json['companyPlace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contractNumber'] = this.contractNumber;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    if (this.billet != null) {
      data['billet'] = this.billet!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.collectionType != null) {
      data['collectionType'] = this.collectionType!.toJson();
    }
    if (this.companyPlace != null) {
      data['companyPlace'] = this.companyPlace!.toJson();
    }
    return data;
  }
}

class Bank {
  Account? account;
  Account? agency;
  String? bankUse;
  String? code;
  String? name;

  Bank({this.account, this.agency, this.bankUse, this.code, this.name});

  Bank.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    agency =
        json['agency'] != null ? new Account.fromJson(json['agency']) : null;
    bankUse = json['bankUse'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.agency != null) {
      data['agency'] = this.agency!.toJson();
    }
    data['bankUse'] = this.bankUse;
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class Account {
  String? digit;
  String? number;

  Account({this.digit, this.number});

  Account.fromJson(Map<String, dynamic> json) {
    digit = json['digit'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['digit'] = this.digit;
    data['number'] = this.number;
    return data;
  }
}

class Billet {
  Amount? amount;
  String? bankTitleNumber;
  String? barcode;
  String? expirationDate;
  String? issueDate;
  String? processingDate;
  String? title;
  String? status;
  String? typefulLine;
  Null? pixQrCode;

  Billet(
      {this.amount,
      this.bankTitleNumber,
      this.barcode,
      this.expirationDate,
      this.issueDate,
      this.processingDate,
      this.title,
      this.status,
      this.typefulLine,
      this.pixQrCode});

  Billet.fromJson(Map<String, dynamic> json) {
    amount =
        json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    bankTitleNumber = json['bankTitleNumber'];
    barcode = json['barcode'];
    expirationDate = json['expirationDate'];
    issueDate = json['issueDate'];
    processingDate = json['processingDate'];
    title = json['title'];
    status = json['status'];
    typefulLine = json['typefulLine'];
    pixQrCode = json['pixQrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    data['bankTitleNumber'] = this.bankTitleNumber;
    data['barcode'] = this.barcode;
    data['expirationDate'] = this.expirationDate;
    data['issueDate'] = this.issueDate;
    data['processingDate'] = this.processingDate;
    data['title'] = this.title;
    data['status'] = this.status;
    data['typefulLine'] = this.typefulLine;
    data['pixQrCode'] = this.pixQrCode;
    return data;
  }
}

class Amount {
  int? discount;
  double? finalValue;
  int? fine;
  double? interest;
  int? value;
  String? status;
  String? expirationDate;

  int? originalValue;

  Amount(
      {this.discount,
      this.finalValue,
      this.fine,
      this.expirationDate,
      this.interest,
      this.value,
      this.status,
      this.originalValue});

  Amount.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    finalValue = json['finalValue'];
    fine = json['fine'];
    interest = json['interest'];
    value = json['value'];
    status = json['billet']['status'];
    status = json['billet']['expirationDate'];
    expirationDate = json['originalValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['response']['response']['billet']['amount']['finalValue'] =
        this.finalValue;
    data['fine'] = this.fine;
    data['interest'] = this.interest;
    data['value'] = this.value;
    data['originalValue'] = this.originalValue;
    data['billet']['status'] = this.status;
    data['billet']['expirationDate'] = this.expirationDate;
    return data;
  }
}

class Client {
  Address? address;
  String? name;
  String? txId;

  Client({this.address, this.name, this.txId});

  Client.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    name = json['name'];
    txId = json['txId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['name'] = this.name;
    data['txId'] = this.txId;
    return data;
  }
}

class Address {
  String? addressComplement;
  String? city;
  int? codeCityId;
  String? number;
  String? postalCode;
  String? state;
  String? street;

  Address(
      {this.addressComplement,
      this.city,
      this.codeCityId,
      this.number,
      this.postalCode,
      this.state,
      this.street});

  Address.fromJson(Map<String, dynamic> json) {
    addressComplement = json['addressComplement'];
    city = json['city'];
    codeCityId = json['codeCityId'];
    number = json['number'];
    postalCode = json['postalCode'];
    state = json['state'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressComplement'] = this.addressComplement;
    data['city'] = this.city;
    data['codeCityId'] = this.codeCityId;
    data['number'] = this.number;
    data['postalCode'] = this.postalCode;
    data['state'] = this.state;
    data['street'] = this.street;
    return data;
  }
}

class CollectionType {
  String? accept;
  String? loanPortfolio;
  String? quantity;
  String? specieTitle;

  CollectionType(
      {this.accept, this.loanPortfolio, this.quantity, this.specieTitle});

  CollectionType.fromJson(Map<String, dynamic> json) {
    accept = json['accept'];
    loanPortfolio = json['loanPortfolio'];
    quantity = json['quantity'];
    specieTitle = json['specieTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accept'] = this.accept;
    data['loanPortfolio'] = this.loanPortfolio;
    data['quantity'] = this.quantity;
    data['specieTitle'] = this.specieTitle;
    return data;
  }
}
