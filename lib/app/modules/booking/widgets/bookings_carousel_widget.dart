import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/booking_model.dart';
import '../../../widgets/circular_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/ui.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../controllers/bookings_controller.dart';
import 'booking_row_widget.dart';

class BookingsCarouselWidget extends StatelessWidget {
  final controller = Get.find<BookingsController>();
  final List<Booking> bookings;
  final selectedBooking = Booking().obs;

  BookingsCarouselWidget({Key key, List<Booking> this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 230,
            child: Obx(() {
              if (bookings.isEmpty) {
                return CircularLoadingWidget(height: 190);
              }
              selectedBooking.value = bookings.first;
              return ListView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  primary: false,
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: bookings.length,
                  itemBuilder: (_, index) {
                    var _doctor = bookings.elementAt(index).doctor;
                    var _task = bookings.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        selectedBooking.value = _task;
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsetsDirectional.only(end: 20, start: index == 0 ? 20 : 0, top: 20, bottom: 10),
                        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                          ],
                        ),
                        child: Column(
                          //alignment: AlignmentDirectional.topStart,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: CachedNetworkImage(
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl: _doctor.media.thumb,
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 100,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error_outline),
                              ),
                            ),
                            Obx(
                                  () => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                // height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: selectedBooking.value == _task ? Get.theme.accentColor : Get.theme.primaryColor,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                ),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      _doctor.name,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: Get.textTheme.bodyText2.merge(TextStyle(color: selectedBooking.value == _task ? Get.theme.primaryColor : Get.theme.hintColor)),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${DateFormat.yMMMMd().format(selectedBooking.value.dateTime)}',
                                      style: Get.textTheme.caption.merge(TextStyle(color: selectedBooking.value == _task ? Get.theme.primaryColor : Get.theme.focusColor)),
                                    ),
                                    Text(
                                      'At ${DateFormat('HH:mm').format(selectedBooking.value.dateTime)}',
                                      style: Get.textTheme.caption.merge(TextStyle(color: selectedBooking.value == _task ? Get.theme.primaryColor : Get.theme.focusColor)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            })
        ),
        Obx(() {
          if (!selectedBooking.value.hasData) {
            return CircularLoadingWidget(height: 300);
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        imageUrl: selectedBooking.value.doctor.media.thumb,
                        placeholder: (context, url) => Image.asset(
                          'assets/img/loading.gif',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 70,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error_outline),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Wrap(
                        spacing: 5,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            selectedBooking.value.doctor?.name ?? '',
                            style: Get.textTheme.bodyText2,
                            maxLines: 3,
                            // textAlign: TextAlign.end,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Get.theme.focusColor.withOpacity(0.1),
                            ),
                            child: Text(
                              selectedBooking.value.progress.tr,
                              style: TextStyle(color: Get.theme.hintColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1, height: 40),
                TaskRowWidget(
                    description: "Time".tr,
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      runAlignment: WrapAlignment.end,
                      children: [
                        Text(
                          '${DateFormat.yMMMMd().format(selectedBooking.value.dateTime)}',
                        ),
                        Text('At ${DateFormat('HH:mm').format(selectedBooking.value.dateTime)}'),
                      ],
                    ),
                    hasDivider: true),
                TaskRowWidget(description: "Payment Method".tr, value: selectedBooking.value.paymentMethod.name, hasDivider: true),
                TaskRowWidget(
                  description: "Tax Amount".tr,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Ui.getPrice(selectedBooking.value.tax, style: Get.textTheme.bodyText2),
                  ),
                ),
                TaskRowWidget(
                  description: "Total Amount".tr,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Ui.getPrice(selectedBooking.value.total, style: Get.textTheme.headline6),
                  ),
                  hasDivider: true,
                ),
                TaskRowWidget(description: "Address".tr, value: selectedBooking.value.address.address, hasDivider: true),
                TaskRowWidget(description: "Description".tr, value: selectedBooking.value.description),
              ],
            ),
          );
        })
      ],
    );
  }
}
