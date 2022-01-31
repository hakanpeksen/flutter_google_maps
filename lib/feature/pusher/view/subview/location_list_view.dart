part of '../pusher_client_view.dart';

ListView _buildLocationUpdateListView(LocationModel? data, BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      Column(
        children: [
          Text('Kurye: ${data?.kurye ?? ''}', style: context.textTheme.headline5),
          Text(data?.latitude ?? '', style: context.textTheme.headline5),
          Text(data?.longitude ?? '', style: context.textTheme.headline6),
          Text('Estimated: ${data?.estimated.toString() ?? ''}',
              style: context.textTheme.headline6),
        ],
      )
    ],
  );
}

Center _loadingWidget() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Center _notFoundTextWidget() {
  return const Center(
    child: Text('No data'),
  );
}
