import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/presentation/bloc/number_bloc/number_bloc.dart';
import 'package:project_task/src/presentation/pages/number/widgets/general_widget_page.dart';

class NumberPage extends StatefulWidget {
//  static const nameRoute = '/numberPage';

  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final numberRoomBloc = NumberBloc(AccommodationApi(Dio()));
  String? titleOfHotel;

  @override
  void initState() {
    numberRoomBloc.add(LoadNumberSpaceEvent());
    super.initState();
  }

  @override
  void dispose() {
    numberRoomBloc.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final transferArg = ModalRoute.of(context)?.settings.arguments;
    titleOfHotel = transferArg.toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Text(
          titleOfHotel ?? 'Отель',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            //  height: 0.07,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NumberBloc, NumberState>(
        bloc: numberRoomBloc,
        builder: (context, state) {
          if (state is NumberSpaceLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 8),
                      itemCount: state.numberSpaceModel.rooms.length,
                      itemBuilder: (context, index) {
                        return GeneralPatternView(
                            name: state.numberSpaceModel.rooms[index].name,
                            price: state.numberSpaceModel.rooms[index].price,
                            pricePer:
                                state.numberSpaceModel.rooms[index].price_per,
                            peculiarities: state
                                .numberSpaceModel.rooms[index].peculiarities,
                            imageUrls:
                                state.numberSpaceModel.rooms[index].image_urls);
                      }),
                ),
                // Container(
                //   height: 34,
                //   width: double.infinity,
                //   color: Colors.white,
                // ),
                const SizedBox(
                  height: 8,
                ),
              ],
            );
          } else{
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
