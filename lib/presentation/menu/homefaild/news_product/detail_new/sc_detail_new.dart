import 'dart:async';
import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'bloc/bloc.dart';

class DetailNewScreen extends StatefulWidget {
  @override
  _DetailNewScreenState createState() => _DetailNewScreenState();
}

class _DetailNewScreenState extends State<DetailNewScreen> {
  int newId;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        newId = arguments['newId'];
        print('---newId---');
        print(newId);
        BlocProvider.of<DetailNewBloc>(context).add(LoadDetailNew(newId));
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _onArgument();
  }

  @override
  Widget build(BuildContext context) {
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);

    return BlocBuilder<DetailNewBloc, DetailNewState>(
        builder: (context, state) {
          if (state is DetailNewLoaded){
            return Scaffold(
              body: Stack(
                children:[
                  _buildContent(state),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: _buildAppBar(),
                  )
                ] ,
              ),
            );
          } else if (state is DetailNewLoading) {
            return Center(
              child: WidgetCircleProgress(),
            );
          } else if (state is DetailNewNotLoaded) {
            return WidgetScreenError(
              status: state.status,
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        },
    );
  }

  _buildAppBar() => WidgetAppbar(
    title: AppLocalizations.of(context).translate('news_detail.title').toUpperCase(),
    left: [WidgetAppbarMenuBack()],
  );

  Widget _buildContent(DetailNewState state) {
    if (state is DetailNewLoaded){
      return ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Image.network("${state.news.image}", fit: BoxFit.fill,),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(state.news.content),
          )
        ],
      );
    }else if (state is DetailNewLoading) {
      return Center(
        child: WidgetCircleProgress(),
      );
    } else if (state is DetailNewNotLoaded) {
      return WidgetScreenError(
        status: state.status,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }
}
