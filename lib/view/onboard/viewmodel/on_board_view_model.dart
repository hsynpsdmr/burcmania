import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_viewmodel.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = OnBoardViewModelBase with _$OnBoardViewModel;

abstract class OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => myContext = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @override
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title, LocaleKeys.onBoard_page1_desc, SVGImagePaths.instance.chattingSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title, LocaleKeys.onBoard_page2_desc, SVGImagePaths.instance.encryptionSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title, LocaleKeys.onBoard_page3_desc, SVGImagePaths.instance.socialSVG));
  }

  Future<void> completeToOnBoard() async {
    navigation.navigateToPageClear(path: NavigationConstants.homeView);
  }
}
