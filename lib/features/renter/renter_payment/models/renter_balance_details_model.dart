class RenterBalanceDetailsModel {
  final String id;
  String? transactionId;
  final bool isSuccess;
  final DateTime date;
  final double gasBill;
  final double waterBill;
  final double utilityAdminFee;
  final double trashReimbursement;
  final double rentersInsurance;
  final double parkingRent;
  final double pestControlBill;

  RenterBalanceDetailsModel({
    required this.id,
    this.transactionId,
    required this.isSuccess,
    required this.date,
    required this.gasBill,
    required this.waterBill,
    required this.utilityAdminFee,
    required this.trashReimbursement,
    required this.rentersInsurance,
    required this.parkingRent,
    required this.pestControlBill,
  });

  double get totalBill {
    return gasBill +
        waterBill +
        utilityAdminFee +
        trashReimbursement +
        rentersInsurance +
        parkingRent +
        pestControlBill;
  }

   static final List<RenterBalanceDetailsModel> dummyBalanceDeatailsList = <RenterBalanceDetailsModel>[
     RenterBalanceDetailsModel(
      id: "1",
      isSuccess: false,
      date: DateTime.now(),
      gasBill: 150.0,
      waterBill: 170.0,
      utilityAdminFee: 100.0,
      trashReimbursement: 50.0,
      rentersInsurance: 30.0,
      parkingRent: 100.0,
      pestControlBill: 10.0,
    ),

    RenterBalanceDetailsModel(
      id: "2",
      transactionId: "1345 GDSFH 346",
      isSuccess: true,
      date: DateTime(2025, 6, 1),
      gasBill: 35.5,
      waterBill: 22.0,
      utilityAdminFee: 12.5,
      trashReimbursement: 6.0,
      rentersInsurance: 14.0,
      parkingRent: 45.0,
      pestControlBill: 7.5,
    ),

    RenterBalanceDetailsModel(
      id: "3",
      transactionId: "1345 3463 346",
      isSuccess: true,
      date: DateTime(2025, 5, 1),
      gasBill: 40.0,
      waterBill: 20.0,
      utilityAdminFee: 15.0,
      trashReimbursement: 5.0,
      rentersInsurance: 16.0,
      parkingRent: 50.0,
      pestControlBill: 6.0,
    ),

    RenterBalanceDetailsModel(
      id: "4",
      transactionId: "1345 SGSGS 346",
      isSuccess: true,
      date: DateTime(2025, 4, 1),
      gasBill: 30.0,
      waterBill: 25.5,
      utilityAdminFee: 10.0,
      trashReimbursement: 4.5,
      rentersInsurance: 12.0,
      parkingRent: 40.0,
      pestControlBill: 5.0,
    ),

    RenterBalanceDetailsModel(
      id: "5",
      transactionId: "1345 3463 346",
      isSuccess: true,
      date: DateTime(2025, 3, 1),
      gasBill: 28.0,
      waterBill: 23.0,
      utilityAdminFee: 11.0,
      trashReimbursement: 6.5,
      rentersInsurance: 13.0,
      parkingRent: 48.0,
      pestControlBill: 6.8,
    )

   ];
}
