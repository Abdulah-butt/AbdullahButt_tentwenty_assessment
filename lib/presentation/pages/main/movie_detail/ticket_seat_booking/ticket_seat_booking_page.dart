import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/ticket_date_booking_state.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/widgets/cinema_seats_section.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/widgets/selected_seat_chip.dart';
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
            Text(widget.initialParams.movieName),
            Text(
              "${widget.initialParams.date}  I  ${widget.initialParams.hall}",
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kScreenHorizontalPadding),
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: SeatTypesSection()),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<TicketSeatBookingCubit, TicketSeatBookingState>(
                      bloc: cubit,
                      builder: (context, state) {
                        return Wrap(
                          children: [
                            for(var seat in state.selectedSeats)
                              SelectedSeatChip(
                                seat: seat,
                                onRemove: cubit.onRemoveAction,
                              )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
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
