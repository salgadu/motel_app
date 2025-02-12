import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';
import 'package:motel_list/app/motel/interactor/controllers/motel_controller.dart';
import 'package:motel_list/app/motel/interactor/states/motel_state.dart';
import 'package:motel_list/app/motel/ui/widgets/card_motel.dart';
import 'package:motel_list/app/core/components/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  String selectedRegion = 'zona norte';
  bool useMyLocation = false;
  late MotelController _motelController;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _motelController = context.read<MotelController>();
      _motelController.fetchMotelData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MotelController>();
    final mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: Dimensions.smallPadding),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(width: mediaQuery.width * 0.03),
                  Expanded(
                    child: Container(
                      height: mediaQuery.height * 0.045,
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.flash_on),
                                SizedBox(width: mediaQuery.width * 0.01),
                                Text('Ir agora'),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(width: mediaQuery.width * 0.01),
                                Text('Ir outro dia'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: mediaQuery.width * 0.03),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.01),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(selectedRegion,
                                  style: const TextStyle(color: Colors.white)),
                              SizedBox(width: mediaQuery.width * 0.01),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                        SizedBox(height: mediaQuery.height * 0.02),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        CustomButton(
                                          text: "Filtros",
                                          icon: Icons.tune,
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                            width: Dimensions.smallPadding),
                                        CustomButton(
                                          text: "Com desconto",
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                            width: Dimensions.smallPadding),
                                        CustomButton(
                                          text: "Disponíveis",
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                            width: Dimensions.smallPadding),
                                        CustomButton(
                                          text: "Hidro",
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                            width: Dimensions.smallPadding),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (controller.state is MotelLoading) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (controller.state
                                          is MotelError) {
                                        final error =
                                            (controller.state as MotelError)
                                                .failure
                                                .message;
                                        return Center(
                                          child: Text("Erro: $error",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        );
                                      } else if (controller.state
                                          is MotelSuccess) {
                                        final data =
                                            (controller.state as MotelSuccess)
                                                .motelData;

                                        if (data.moteis.isEmpty) {
                                          return const Center(
                                            child: Text(
                                                "Nenhum motel encontrado",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          );
                                        }

                                        return ListView.builder(
                                          itemCount: data.moteis.length,
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final motel = data.moteis[index];
                                            return CardHotel(motel: motel);
                                          },
                                        );
                                      }

                                      return const Center(
                                        child: Text("Selecione uma região",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text('Não há moteis diponiveis no momento',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
