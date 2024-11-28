class SerasaModel {
  List<Reports>? reports;

  SerasaModel({this.reports});

  SerasaModel.fromJson(Map<String, dynamic> json) {
    if (json['reports'] != null) {
      reports = <Reports>[];
      json['reports'].forEach((v) {
        reports!.add(new Reports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reports != null) {
      data['reports'] = this.reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reports {
  String? reportName;
  Registration? registration;
  NegativeData? negativeData;
  Score? score;
  NegativeSummary? negativeSummary;
  Facts? facts;
  Partner? partner;

  Reports(
      {this.reportName,
      this.registration,
      this.negativeData,
      this.score,
      this.negativeSummary,
      this.facts,
      this.partner});

  Reports.fromJson(Map<String, dynamic> json) {
    reportName = json['reportName'];
    registration = json['registration'] != null
        ? new Registration.fromJson(json['registration'])
        : null;
    negativeData = json['negativeData'] != null
        ? new NegativeData.fromJson(json['negativeData'])
        : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    negativeSummary = json['negativeSummary'] != null
        ? new NegativeSummary.fromJson(json['negativeSummary'])
        : null;
    facts = json['facts'] != null ? new Facts.fromJson(json['facts']) : null;
    partner =
        json['partner'] != null ? new Partner.fromJson(json['partner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportName'] = this.reportName;
    if (this.registration != null) {
      data['registration'] = this.registration!.toJson();
    }
    if (this.negativeData != null) {
      data['negativeData'] = this.negativeData!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    if (this.negativeSummary != null) {
      data['negativeSummary'] = this.negativeSummary!.toJson();
    }
    if (this.facts != null) {
      data['facts'] = this.facts!.toJson();
    }
    if (this.partner != null) {
      data['partner'] = this.partner!.toJson();
    }
    return data;
  }
}

class Registration {
  String? documentNumber;
  String? consumerName;
  String? motherName;
  String? birthDate;
  String? statusRegistration;
  String? statusDate;

  Registration(
      {this.documentNumber,
      this.consumerName,
      this.motherName,
      this.birthDate,
      this.statusRegistration,
      this.statusDate});

  Registration.fromJson(Map<String, dynamic> json) {
    documentNumber = json['documentNumber'];
    consumerName = json['consumerName'];
    motherName = json['motherName'];
    birthDate = json['birthDate'];
    statusRegistration = json['statusRegistration'];
    statusDate = json['statusDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentNumber'] = this.documentNumber;
    data['consumerName'] = this.consumerName;
    data['motherName'] = this.motherName;
    data['birthDate'] = this.birthDate;
    data['statusRegistration'] = this.statusRegistration;
    data['statusDate'] = this.statusDate;
    return data;
  }
}

class NegativeData {
  Pefin? pefin;
  Refin? refin;
  Notary? notary;
  Check? check;
  CollectionRecords? collectionRecords;

  NegativeData(
      {this.pefin,
      this.refin,
      this.notary,
      this.check,
      this.collectionRecords});

  NegativeData.fromJson(Map<String, dynamic> json) {
    pefin = json['pefin'] != null ? new Pefin.fromJson(json['pefin']) : null;
    refin = json['refin'] != null ? new Refin.fromJson(json['refin']) : null;
    notary =
        json['notary'] != null ? new Notary.fromJson(json['notary']) : null;
    check = json['check'] != null ? new Check.fromJson(json['check']) : null;
    collectionRecords = json['collectionRecords'] != null
        ? new CollectionRecords.fromJson(json['collectionRecords'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pefin != null) {
      data['pefin'] = this.pefin!.toJson();
    }
    if (this.refin != null) {
      data['refin'] = this.refin!.toJson();
    }
    if (this.notary != null) {
      data['notary'] = this.notary!.toJson();
    }
    if (this.check != null) {
      data['check'] = this.check!.toJson();
    }
    if (this.collectionRecords != null) {
      data['collectionRecords'] = this.collectionRecords!.toJson();
    }
    return data;
  }
}

class Pefin {
  List<PefinResponse>? pefinResponse;
  Summary? summary;

  Pefin({this.pefinResponse, this.summary});

  Pefin.fromJson(Map<String, dynamic> json) {
    if (json['pefinResponse'] != null) {
      pefinResponse = <PefinResponse>[];
      json['pefinResponse'].forEach((v) {
        pefinResponse!.add(new PefinResponse.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pefinResponse != null) {
      data['pefinResponse'] =
          this.pefinResponse!.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class PefinResponse {
  String? occurrenceDate;
  String? legalNatureId;
  String? legalNature;
  String? contractId;
  String? creditorName;
  double? amount;
  bool? principal;

  PefinResponse(
      {this.occurrenceDate,
      this.legalNatureId,
      this.legalNature,
      this.contractId,
      this.creditorName,
      this.amount,
      this.principal});

  PefinResponse.fromJson(Map<String, dynamic> json) {
    occurrenceDate = json['occurrenceDate'];
    legalNatureId = json['legalNatureId'];
    legalNature = json['legalNature'];
    contractId = json['contractId'];
    creditorName = json['creditorName'];
    amount = json['amount'];
    principal = json['principal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occurrenceDate'] = this.occurrenceDate;
    data['legalNatureId'] = this.legalNatureId;
    data['legalNature'] = this.legalNature;
    data['contractId'] = this.contractId;
    data['creditorName'] = this.creditorName;
    data['amount'] = this.amount;
    data['principal'] = this.principal;
    return data;
  }
}

class Summary {
  int? count;
  double? balance;
  String? firstOccurrence;
  String? lastOccurrence;

  Summary(
      {this.count, this.balance, this.firstOccurrence, this.lastOccurrence});

  Summary.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    balance = json['balance'];
    firstOccurrence = json['firstOccurrence'];
    lastOccurrence = json['lastOccurrence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['balance'] = this.balance;
    data['firstOccurrence'] = this.firstOccurrence;
    data['lastOccurrence'] = this.lastOccurrence;
    return data;
  }
}

class Refin {
  List<Null>? refinResponse;
  Summary? summary;

  Refin({this.refinResponse, this.summary});

  Refin.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Notary {
  List<Null>? notaryResponse;
  Summary? summary;

  Notary({this.notaryResponse, this.summary});

  Notary.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Check {
  List<Null>? checkResponse;
  Summary? summary;

  Check({this.checkResponse, this.summary});

  Check.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class CollectionRecords {
  List<Null>? collectionRecordsResponse;
  Summary? summary;

  CollectionRecords({this.collectionRecordsResponse, this.summary});

  CollectionRecords.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Score {
  int? score;
  String? scoreModel;
  String? range;
  String? defaultRate;
  int? codeMessage;
  String? message;

  Score(
      {this.score,
      this.scoreModel,
      this.range,
      this.defaultRate,
      this.codeMessage,
      this.message});

  Score.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scoreModel = json['scoreModel'];
    range = json['range'];
    defaultRate = json['defaultRate'];
    codeMessage = json['codeMessage'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scoreModel'] = this.scoreModel;
    data['range'] = this.range;
    data['defaultRate'] = this.defaultRate;
    data['codeMessage'] = this.codeMessage;
    data['message'] = this.message;
    return data;
  }
}

class NegativeSummary {
  NegativeSummary.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Facts {
  Inquiry? inquiry;
  InquirySummary? inquirySummary;
  StolenDocuments? stolenDocuments;

  Facts({this.inquiry, this.inquirySummary, this.stolenDocuments});

  Facts.fromJson(Map<String, dynamic> json) {
    inquiry =
        json['inquiry'] != null ? new Inquiry.fromJson(json['inquiry']) : null;
    inquirySummary = json['inquirySummary'] != null
        ? new InquirySummary.fromJson(json['inquirySummary'])
        : null;
    stolenDocuments = json['stolenDocuments'] != null
        ? new StolenDocuments.fromJson(json['stolenDocuments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inquiry != null) {
      data['inquiry'] = this.inquiry!.toJson();
    }
    if (this.inquirySummary != null) {
      data['inquirySummary'] = this.inquirySummary!.toJson();
    }
    if (this.stolenDocuments != null) {
      data['stolenDocuments'] = this.stolenDocuments!.toJson();
    }
    return data;
  }
}

class Inquiry {
  List<InquiryResponse>? inquiryResponse;
  Summary? summary;

  Inquiry({this.inquiryResponse, this.summary});

  Inquiry.fromJson(Map<String, dynamic> json) {
    if (json['inquiryResponse'] != null) {
      inquiryResponse = <InquiryResponse>[];
      json['inquiryResponse'].forEach((v) {
        inquiryResponse!.add(new InquiryResponse.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inquiryResponse != null) {
      data['inquiryResponse'] =
          this.inquiryResponse!.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class InquiryResponse {
  String? occurrenceDate;
  String? segmentDescription;
  int? daysQuantity;

  InquiryResponse(
      {this.occurrenceDate, this.segmentDescription, this.daysQuantity});

  InquiryResponse.fromJson(Map<String, dynamic> json) {
    occurrenceDate = json['occurrenceDate'];
    segmentDescription = json['segmentDescription'];
    daysQuantity = json['daysQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occurrenceDate'] = this.occurrenceDate;
    data['segmentDescription'] = this.segmentDescription;
    data['daysQuantity'] = this.daysQuantity;
    return data;
  }
}

class InquirySummary {
  InquiryQuantity? inquiryQuantity;

  InquirySummary({this.inquiryQuantity});

  InquirySummary.fromJson(Map<String, dynamic> json) {
    inquiryQuantity = json['inquiryQuantity'] != null
        ? new InquiryQuantity.fromJson(json['inquiryQuantity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inquiryQuantity != null) {
      data['inquiryQuantity'] = this.inquiryQuantity!.toJson();
    }
    return data;
  }
}

class InquiryQuantity {
  int? actual;
  List<CreditInquiriesQuantity>? creditInquiriesQuantity;

  InquiryQuantity({this.actual, this.creditInquiriesQuantity});

  InquiryQuantity.fromJson(Map<String, dynamic> json) {
    actual = json['actual'];
    if (json['creditInquiriesQuantity'] != null) {
      creditInquiriesQuantity = <CreditInquiriesQuantity>[];
      json['creditInquiriesQuantity'].forEach((v) {
        creditInquiriesQuantity!.add(new CreditInquiriesQuantity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actual'] = this.actual;
    if (this.creditInquiriesQuantity != null) {
      data['creditInquiriesQuantity'] =
          this.creditInquiriesQuantity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreditInquiriesQuantity {
  String? inquiryDate;
  int? occurrences;

  CreditInquiriesQuantity({this.inquiryDate, this.occurrences});

  CreditInquiriesQuantity.fromJson(Map<String, dynamic> json) {
    inquiryDate = json['inquiryDate'];
    occurrences = json['occurrences'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inquiryDate'] = this.inquiryDate;
    data['occurrences'] = this.occurrences;
    return data;
  }
}

class StolenDocuments {
  List<Null>? stolenDocumentsResponse;
  Summary? summary;

  StolenDocuments({this.stolenDocumentsResponse, this.summary});

  StolenDocuments.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Partner {
  Summary? summary;

  Partner({this.summary});

  Partner.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}
