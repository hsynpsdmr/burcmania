import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/component/text/auto_locale_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../_product/_widget/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../viewmodel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildRowFooter(viewModel, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) => buildColumnBody(context, viewModel.onBoardItems[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: buildListViewCircles(viewModel),
        ),
        const Spacer(),
        buildFloatingActionButtonSkip(context, viewModel),
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircle(isSelected: viewModel.currentIndex == index);
        });
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.secondaryContainer,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: context.colors.primaryContainer,
      ),
      onPressed: () => viewModel.completeToOnBoard(),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSecondary),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w500),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
