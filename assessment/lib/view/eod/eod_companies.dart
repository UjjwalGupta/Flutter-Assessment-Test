import 'package:assesment/model/repository/eod/eod_model.dart';
import 'package:assesment/view_model/eod/eod_view_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/numeric_constant.dart';
import '../../constants/strings.dart';
import '../../utils/utility.dart';

// ignore: must_be_immutable
class EodCompanies extends StatelessWidget {
  EodCompanies({super.key});

  late BuildContext buildContext;
  final EODViewModel _eodViewModel = Get.find();
  final _strings = Strings.instance;
  final _appColors = AppColors.instance;
  final _controller = ScrollController();
  final _utility = Utility.instance;
  final _numericConstant = NumericConstant.instance;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    Future.delayed(const Duration(microseconds: 100), () async {
      // _eodViewModel.updateInternetConnection(await InternetConnectionChecker().hasConnection);
      if(_eodViewModel.isInternetConnected) {
        showLoaderDialog(context, _strings.loadingText);
        _eodViewModel.getEodData().then((value) {
          Get.back();
        });
      }
    });

    return GetBuilder<EODViewModel>(
        builder: (_) => Scaffold(
              primary: true,
              appBar: AppBar(
                title: Text(_strings.appName),
              ),
              body: _buildBody(),
            ));
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFromToDateField(),
                  _buildSearchField(),
                  _eodViewModel.isInternetConnected?
                  _eodViewModel.companyDataList.isNotEmpty
                      ? _buildList()
                      : Container(
                          alignment: Alignment.center,
                          height: Get.mediaQuery.size.height / 2,
                          width: double.infinity,
                          color: Colors.white,
                        ): Container(
                          alignment: Alignment.center,
                          height: Get.mediaQuery.size.height / 2,
                          width: double.infinity,
                          color: Colors.white,
                    child: Text(_strings.noInternetConnection),
                        ),
                ])));
  }

  Widget _buildList() {
    return Container(
      height: Get.mediaQuery.size.height-30,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: ListView.builder(
          controller: _controller,
          itemCount: _eodViewModel.companyDataList.length,
          itemBuilder: (buildContext, index) {
            return _buildStatementItem(index, _eodViewModel.companyDataList[index]);
          }),
    );
  }

  Widget _buildStatementItem(int index, Data data) {
    return Container(
      color: index % 2 != 0 ? Colors.white38 : Colors.black12,
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Open')),
                Expanded(flex: 1, child: Text(data.open!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('High')),
                Expanded(flex: 1, child: Text(data.high!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Low')),
                Expanded(flex: 1, child: Text(data.low!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Close')),
                Expanded(flex: 1, child: Text(data.close!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Volume')),
                Expanded(flex: 1, child: Text(data.volume!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Symbol')),
                Expanded(flex: 1, child: Text(data.symbol!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Exchange')),
                Expanded(flex: 1, child: Text(data.exchange!.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text('Date')),
                Expanded(
                    flex: 1,
                    child: Text(_strings.outputFormat2.format(
                        _strings.inputFormat.parse(_utility.convertDateToString(
                            DateTime.parse(data.date!.toString())))))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFromToDateField() {
    return Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        height: 60,
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  right: 5,
                ),
                child: TextFormField(
                  onTap: () {
                    showCalendarDatePicker2Dialog(
                      context: buildContext,
                      config: CalendarDatePicker2WithActionButtonsConfig(
                          shouldCloseDialogAfterCancelTapped: true),
                      dialogSize: const Size(325, 400),
                      borderRadius: BorderRadius.circular(15),
                    ).then((value) {
                      if (value != null) {
                            String from=_strings.outputFormat.format(_strings.inputFormat
                                .parse(_utility.convertDateToString(value[0]!)));
                        _eodViewModel.updateFromDate(from);
                      }
                    });
                  },
                  showCursor: false,
                  key: Key(_eodViewModel.fromDate),
                  initialValue: _eodViewModel.fromDate,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    labelText: 'Date From',
                    labelStyle: TextStyle(color: _appColors.greenColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _appColors.greenColor,
                          style: BorderStyle.solid,
                          width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _appColors.greenColor,
                          style: BorderStyle.solid,
                          width: 1.5),
                    ),
                    suffixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.green,
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  right: 5,
                ),
                child: TextFormField(
                  onTap: () {
                    showCalendarDatePicker2Dialog(
                      context: buildContext,
                      config: CalendarDatePicker2WithActionButtonsConfig(
                          shouldCloseDialogAfterCancelTapped: true),
                      dialogSize: const Size(325, 400),
                      borderRadius: BorderRadius.circular(15),
                    ).then((value) {
                      if (value != null) {
                        String toDate =_strings.outputFormat.format(_strings.inputFormat
                            .parse(_utility.convertDateToString(value[0]!)));
                        _eodViewModel.updateToDate(toDate);
                        Future.delayed(const Duration(microseconds: 100), () {
                          showLoaderDialog(buildContext, _strings.loadingText);
                          _eodViewModel.getEodData().then((value) {
                            Get.back();
                          });
                        });
                      }
                    });
                  },
                  showCursor: false,
                  key: Key(_eodViewModel.toDate),
                  initialValue: _eodViewModel.toDate,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    labelText: 'Date To',
                    labelStyle: TextStyle(color: _appColors.greenColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _appColors.greenColor,
                          style: BorderStyle.solid,
                          width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _appColors.greenColor,
                          style: BorderStyle.solid,
                          width: 1.5),
                    ),
                    suffixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.green,
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildSearchField() {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: _numericConstant.searchBoxHeight,
        child: TextFormField(
          onChanged: (value) {
            _eodViewModel.filterEodData(value);
          },
          decoration: InputDecoration(hintText: _strings.typeValueHere),
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
              margin: const EdgeInsets.only(left: 7), child: Text(message)),
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
