import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constatns.dart';
import '../viewmodel/horoscope_view_model.dart';

class HoroscopeView extends StatefulWidget {
  final String horoKey;
  const HoroscopeView({Key? key, required this.horoKey}) : super(key: key);

  @override
  State<HoroscopeView> createState() => _HoroscopeViewState();
}

class _HoroscopeViewState extends State<HoroscopeView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HoroscopeViewModel>(
      viewModel: HoroscopeViewModel(),
      onDispose: (model) {
        model.customDispose();
      },
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        model.tabController = TabController(length: 2, vsync: this);
        model.getHoroscopeDetail(widget.horoKey);
        model.getHoro(widget.horoKey);
      },
      onPageBuilder: (BuildContext context, HoroscopeViewModel viewModel) => SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //ClipRRect(borderRadius: BorderRadius.circular(4.0), child: Image.asset(ImageConstants.instance.toJpg(widget.horoKey))),
                Hero(
                  tag: widget.horoKey,
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.cyan, width: 1),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(ImageConstants.instance.toJpg(widget.horoKey)), fit: BoxFit.contain),
                    ),
                  ),
                ),
                Text(viewModel.horo.name),
                Text(viewModel.horo.date),
                TabBar(
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.blue,
                  tabs: const [
                    Tab(text: 'Günlük Yorum'),
                    Tab(text: 'Özellikler'),
                  ],
                  controller: viewModel.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    controller: viewModel.tabController,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(ImageConstants.instance.toPng('horo_detail_bg')), fit: BoxFit.cover),
                          ),
                          child: const Text('Yorum')),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(ImageConstants.instance.toPng('horo_detail_bg')), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 75),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black, fontSize: 15),
                              children: <TextSpan>[
                                const TextSpan(text: '\n🔹 Element : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.element}'),
                                const TextSpan(text: '\n🔹 Renk : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.color}'),
                                const TextSpan(text: '\n🔹 Kalite : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.quality}'),
                                const TextSpan(text: '\n🔹 Gün : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.day}'),
                                const TextSpan(text: '\n🔹 Gezegen : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.planet}'),
                                const TextSpan(text: '\n🔹 Mücevher : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.gem}'),
                                const TextSpan(text: '\n🔹 Çiçek : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.flower}'),
                                const TextSpan(text: '\n🔹 Ev : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.house}'),
                                const TextSpan(text: '\n🔹 Şanslı sayılar : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.numbers}'),
                                const TextSpan(text: '\n🔹 Uyumlu olduğu burçlar : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.compatibility}'),
                                const TextSpan(text: '\n🔹 Güçlü yönler : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.strengths}'),
                                const TextSpan(text: '\n🔹 Zayıf Yönler : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.weaknesses}'),
                                const TextSpan(text: '\n🔹 Sevdikleri : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.likes}'),
                                const TextSpan(text: '\n🔹 Sevmedikleri : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${viewModel.horoModel?.dislikes}'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // child: Center(
            //   child: Text(viewModel.getHoroscopeDetail(widget.horoKey) == null ? '' : viewModel.getHoroscopeDetail(widget.horoKey).toString()),
            // ),
          ),
        ),
      ),
    );
  }
}
