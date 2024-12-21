import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/widgets/cinema_type_widget.dart';
import 'package:tentwenty_assessment/presentation/widgets/custom_button.dart';
import 'ticket_date_booking_cubit.dart';
import 'ticket_date_booking_initial_params.dart';
import 'ticket_date_booking_state.dart';
import 'widgets/movie_date_chip.dart';

class TicketDateBookingPage extends StatefulWidget {
  final TicketDateBookingCubit cubit;
  final TicketDateBookingInitialParams initialParams;

  static const path = '/TicketDateBookingPage';

  const TicketDateBookingPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<TicketDateBookingPage> createState() => _TicketDateBookingState();
}

class _TicketDateBookingState extends State<TicketDateBookingPage> {
  TicketDateBookingCubit get cubit => widget.cubit;

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
        title: BlocBuilder<TicketDateBookingCubit, TicketDateBookingState>(
          bloc: cubit,
          builder: (context, state) {
            return Skeletonizer(
              enabled: state.loading,
              child: Column(
                children: [
                  Text("${state.movie.title}"),
                  Text(
                    "In theaters ${state.movie.releaseDate}",
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.colorTheme.primary),)
                ],
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<TicketDateBookingCubit, TicketDateBookingState>(
        bloc: cubit,
        builder: (context, state) {
          return Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: kScreenHorizontalPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DateTime dateTime = cubit.availableDates[index];
                        return MovieDateChip(
                          isSelected: state.selectedDate==dateTime,
                          dateTime: dateTime,
                          onSelectDate:cubit.onSelectDate,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CinemaTypeWidget(
                          isSelected: index == 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: kScreenHorizontalPadding),
          child: CustomButton(
            text: "Select Seats",
            onTap: cubit.selectSeatAction,
          ),
        ),
      ),
    );
  }
}


class CinemaSeatPlan extends StatefulWidget {
  @override
  _CinemaSeatPlanState createState() => _CinemaSeatPlanState();
}

class _CinemaSeatPlanState extends State<CinemaSeatPlan> {
  // Number of rows and columns
  final int rows = 10;
  final int cols = 15;

  // Seat status: 0 = available, 1 = selected, 2 = reserved
  List<List<int>> seatStatus = List.generate(
    10, // rows
        (row) =>
        List.generate(
          15, // columns
              (col) => col % 3 == 0 ? 2 : 0, // Example reserved seats
        ),
  );

  // Function to handle seat tap
  void onSeatTap(int row, int col) {
    setState(() {
      if (seatStatus[row][col] == 0) {
        seatStatus[row][col] = 1; // Mark as selected
      } else if (seatStatus[row][col] == 1) {
        seatStatus[row][col] = 0; // Deselect seat
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cinema Seat Plan"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Screen indicator
          const Center(
            child: Text(
              "SCREEN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Seat grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: rows * cols,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  final row = index ~/ cols;
                  final col = index % cols;

                  // Seat status and color mapping
                  final seatColor = seatStatus[row][col] == 0
                      ? Colors.grey.shade300 // Available
                      : seatStatus[row][col] == 1
                      ? Colors.orange // Selected
                      : Colors.blue.shade800; // Reserved

                  return GestureDetector(
                    onTap: seatStatus[row][col] == 2
                        ? null // Reserved seats are not tappable
                        : () => onSeatTap(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        color: seatColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

