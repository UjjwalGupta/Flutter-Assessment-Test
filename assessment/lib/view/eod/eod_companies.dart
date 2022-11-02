import 'package:assesment/model/repository/eod/eod_model.dart';
import 'package:assesment/utils/ui_helper/ui_helper.dart';
import 'package:assesment/view_model/eod/eod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import '../../constants/colors.dart';
import '../../constants/numeric_constant.dart';
import '../../constants/strings.dart';
import '../../utils/utility.dart';

// ignore: must_be_immutable
class EodCompanies extends StatelessWidget {
  EodCompanies({Key? key}) : super(key: key);

  late BuildContext buildContext;
  final EODViewModel _eodViewModel = Get.find();
  final _strings = Strings.instance;
  final _appColors = AppColors.instance;
  final _controller = ScrollController();
  final _utility = Utility.instance;
  final _uiHelper = UIHelper.instance;
  final _numericConstant = NumericConstant.instance;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    
    // _controller.addListener(() {
    //   if (_controller.position.atEdge) {
    //     bool isTop = _controller.position.pixels == 0;
    //     if (!isTop) {
    //       Future.delayed(const Duration(milliseconds: 500), () {
    //         _statementViewModel.updatePageIndex(_statementViewModel.pageIndex + 1);
    //         LoaderWidget().showLoaderDialog(context, _strings.loadingText);
    //         _statementViewModel
    //             .getStatements()
    //             .then((value) => Get.back());
    //       });
    //     }
    //   }
    // });

      showLoaderDialog(context, _strings.loadingText);
        _eodViewModel.getEodData().then((value) {
          Get.back();
        });

    return GetBuilder<EODViewModel>(
        builder: (_) => Scaffold(
              primary: true,
              appBar: AppBar(title: Text(_strings.appName),),
             body: _buildBody(),
            ));
  }

  Widget _buildBody() {
    return Stack(children: [
      Container(color: _appColors.backgroundColor),
      SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchField(),
                    _eodViewModel.companyData.isNotEmpty
                        ? _buildList()
                        : Container(
                            alignment: Alignment.center,
                            height: _numericConstant.currentDeviceHeight / 2,
                            width: double.infinity,
                            color: Colors.white,
                            // child: commonWidget.montserratSemiBoldText(
                            //     _strings.noDataAvailable,
                            //     _appColors.ashColor),
                          ),
                  ]))),

    ]);
  }

  Widget _buildList() {
    return Container(
      height: _numericConstant.currentDeviceHeight / 2-30,
      decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: color,
          // ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: ListView.builder(
          controller: _controller,
          itemCount: _eodViewModel.companyData.length,
          itemBuilder: (buildContext, index) {
            return _buildStatementItem(
                index,_eodViewModel.companyData[index]);
          }),
    );
  }

  Widget _buildStatementItem(int index, Data data) {
    return Container(
      color: index % 2 != 0
          ? Colors.white38
          : Colors.black12,
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Open')),
               Expanded(
                    flex: 1,
                    child: Text(data.open!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('High')),
               Expanded(
                    flex: 1,
                    child: Text(data.high!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Low')),
               Expanded(
                    flex: 1,
                    child: Text(data.low!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Close')),
               Expanded(
                    flex: 1,
                    child: Text(data.close!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Volume')),
               Expanded(
                    flex: 1,
                    child: Text(data.volume!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Symbol')),
               Expanded(
                    flex: 1,
                    child: Text(data.symbol!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Exchange')),
               Expanded(
                    flex: 1,
                    child: Text(data.exchange!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Date')),
               Expanded(
                    flex: 1,
                    child: Text(
                        _strings.outputFormat2.format(_strings.inputFormat
                            .parse(_utility.convertDateToString(DateTime.parse(data.date!.toString())))))
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFromToDateField() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           alignment: Alignment.centerRight,
  //           child: _buildSearchDropdown(
  //               _statementViewModel
  //                   .statementSearchOptions.data!.monthFromOptions!,
  //               _strings.monthFrom,
  //               _strings.monthFrom,
  //               false),
  //         ),
  //       ),
  //       const SizedBox(
  //         width: 10,
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           alignment: Alignment.centerRight,
  //           child: _buildSearchDropdown(
  //               _statementViewModel
  //                   .statementSearchOptions.data!.monthToOptions!,
  //               _strings.monthTo,
  //               _strings.monthTo,
  //               false),
  //         ),
  //       ),
  //     ],
  //   )
  //       // )
  //       ;
  // }

  Widget _buildSearchField() {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: _numericConstant.searchBoxHeight,
        child: TextFormField(
            onChanged: (value) {
              // if (fieldName == _strings.invoiceNumber) {
              //   _claimsViewModel.invoiceNumberController.text = (value);
              //   _claimsViewModel.invoiceNumberController.selection =
              //       TextSelection.collapsed(
              //           offset: _claimsViewModel
              //               .invoiceNumberController.text.length);
              // } else if (fieldName == _strings.planId) {
              //   _claimsViewModel.planIdFilterController.text = (value);
              //   _claimsViewModel.planIdFilterController.selection =
              //       TextSelection.collapsed(
              //           offset: _claimsViewModel
              //               .planIdFilterController.text.length);
              // } else if (fieldName == _strings.planIdSearch) {
              //   _claimsViewModel.planIdSearchController.text = (value);
              //   _claimsViewModel.planIdSearchController.selection =
              //       TextSelection.collapsed(
              //           offset: _claimsViewModel
              //               .planIdSearchController.text.length);
              // } else if (fieldName == _strings.beneficiary) {
              //   _claimsViewModel.beneficiaryFilterController.text = (value);
              //   _claimsViewModel.beneficiaryFilterController.selection =
              //       TextSelection.collapsed(
              //           offset: _claimsViewModel
              //               .beneficiaryFilterController.text.length);
              // } else if (fieldName == _strings.provider) {
              //   _claimsViewModel.providerFilterController.text = (value);
              //   _claimsViewModel.providerFilterController.selection =
              //       TextSelection.collapsed(
              //           offset: _claimsViewModel
              //               .providerFilterController.text.length);
              // }
            },
            // decoration: _uiHelper.getSearchInputDecorationStyle(
            //     fieldName == _strings.planIdSearch
            //         ? _strings.planId
            //         : fieldName,
            //     _strings.empty,
            //     NumericConstant.fontSize12,
            //     _strings.fontMontserrat,
            //     FontStyle.normal,
            //     FontWeight.normal)
        ),
      ),
    );
  }

  AlertDialog showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text(message)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return alert;
  }

}
