import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tentwenty_assessment/core/enums/seat_status.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/domain/entities/seat.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_state.dart';

class CinemaSeatsSection extends StatelessWidget {
  final TicketSeatBookingCubit cubit;

  const CinemaSeatsSection({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketSeatBookingCubit, TicketSeatBookingState>(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _movieScreen(context: context),

              /// rows
              for (int row = 0; row < 10; row++)
                FittedBox(
                  child: Row(
                    children: [
                      for (int column = 0; column < 20; column++) ...[
                        GestureDetector(
                          onTap: () {
                            Seat seat = Seat(seatNo: column, lineNo: row,

                            );
                            cubit.selectSeat(seat);
                          },
                          child: SvgPicture.asset(
                            Assets.seat,
                            color: state.selectedSeats
                                    .contains(Seat(seatNo: column, lineNo: row))
                                ? SeatStatus.selected.color
                                : row == 9
                                    ? SeatStatus.vip.color
                                    : null,
                          ),
                        ),
                        column == 4 || column == 15
                            ? SizedBox(
                                width: 20,
                              )
                            : SizedBox.shrink(),
                      ]
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  Widget _movieScreen({required BuildContext context}) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.screen,
          width: context.sw,
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Screen",
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colorTheme.tertiary),
          ),
        ))
      ],
    );
  }
}
