import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constatns.dart';
import '../../horoscope/model/horoscope_property.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.asset(ImageConstants.instance.horoscopeSign, fit: BoxFit.fill),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, 50.0, 0.0),
                child: GridView.count(
                  padding: const EdgeInsets.all(6),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: HoroscopeProperty.horoscopeList
                      .map(
                        (horo) => GestureDetector(
                          onTap: () => viewModel.goHoroscope(horo.key),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.white,
                            elevation: 6,
                            //clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(flex: 7, child: Hero(tag: horo.key, child: ClipRRect(borderRadius: BorderRadius.circular(4.0), child: Image.asset(ImageConstants.instance.toJpg(horo.key))))),
                                //Flexible(child: Text(horo.name, textWidthBasis: TextWidthBasis.parent, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 20))),
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: const TextStyle(color: Colors.black, fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(text: horo.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text: '\n${horo.date}',
                                            style: const TextStyle(color: Colors.black, fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
