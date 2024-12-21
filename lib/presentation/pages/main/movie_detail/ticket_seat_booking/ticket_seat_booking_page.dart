import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/widgets/cinema_seats_section.dart';
import 'package:tentwenty_assessment/presentation/widgets/custom_button.dart';
import 'ticket_seat_booking_cubit.dart';
import 'ticket_seat_booking_initial_params.dart';
import 'ticket_seat_booking_state.dart';
import 'widgets/seat_types_section.dart';

class TicketSeatBookingPage extends StatefulWidget {
  final TicketSeatBookingCubit cubit;
  final TicketSeatBookingInitialParams initialParams;

  static const path = '/TicketSeatBookingPage';

  const TicketSeatBookingPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<TicketSeatBookingPage> createState() => _TicketSeatBookingState();
}

class _TicketSeatBookingState extends State<TicketSeatBookingPage> {
  TicketSeatBookingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.surfaceDim,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Column(
          children: [
            Text("The King's Man"),
            Text(
              "March 5, 2021  I  12:30 hall 1",
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.colorTheme.primary),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CinemaSeatsSection(
            cubit: cubit,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SvgPicture.asset(
          //     Assets.cinema,
          //     width: context.sw,
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kScreenHorizontalPadding),
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: SeatTypesSection()),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: context.colorTheme.surfaceDim,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Total price",
                                style: context.textTheme.bodySmall,
                              ),
                              Text(
                                "\$ 50",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                        child: CustomButton(
                          text: "Proceed to pay",
                          onTap: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
