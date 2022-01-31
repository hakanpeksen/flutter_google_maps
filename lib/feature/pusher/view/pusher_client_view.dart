import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app_constants.dart';
import '../model/order_model.dart';
import '../viewmodel/pusher_client_view_model.dart';

part 'subview/location_list_view.dart';

class PusherClientView extends StatefulWidget {
  const PusherClientView({Key? key}) : super(key: key);

  @override
  _PusherClientState createState() => _PusherClientState();
}

class _PusherClientState extends State<PusherClientView> {
  late PusherClientViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PusherClientViewModel();
    viewModel.initPusher();
  }

  @override
  void dispose() {
    //Stream i kapatıyoruz
    viewModel.statusController.close();
    viewModel.locationController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusher App'),
      ),
      body: Center(
          child: Column(
        children: [
          _buildStreamStatusBuilder(),
          _buildStreamLocationBuilder(),
          _buildDeleveredButton,
        ],
      )),
    );
  }

  ElevatedButton get _buildDeleveredButton => ElevatedButton(
      child: const Text('Teslim Edildi'),
      onPressed: () {
        // channel ı kapat
        viewModel.pusher.unsubscribe(AppConstants.channelName);
        // eventler i kapat
        viewModel.channel.unbind(AppConstants.statusEvent);
        viewModel.channel.unbind(AppConstants.locationEvent);
      });

  StreamBuilder<String> _buildStreamStatusBuilder() {
    return StreamBuilder<String>(
      stream: viewModel.stream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          return Center(
            child: Text(snapshot.data ?? '', style: context.textTheme.headline5),
          );
        }
        return _notFoundTextWidget();
      },
    );
  }

  StreamBuilder<LocationModel> _buildStreamLocationBuilder() {
    return StreamBuilder<LocationModel>(
      stream: viewModel.locationStream,
      builder: (context, AsyncSnapshot<LocationModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          final data = snapshot.data;
          return _buildLocationUpdateListView(data, context);
        }
        return _notFoundTextWidget();
      },
    );
  }
}
