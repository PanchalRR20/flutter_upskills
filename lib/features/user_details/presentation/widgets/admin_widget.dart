import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/core/widgets/center_circular_widget.dart';
import '../cubit/user_details_cubit.dart';
import '../cubit/user_details_state.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({Key? key}) : super(key: key);

  @override
  _AdminWidgetState createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  late UserDetailCubit _userDetailCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userDetailCubit = BlocProvider.of<UserDetailCubit>(context);
    _userDetailCubit.fetchUserDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admins")),
      body: getListWidget(),
    );
  }

  Widget getListWidget() {
    return BlocBuilder<UserDetailCubit, UserDetailCubitState>(
      builder: (context, state) {
        if (state is StateInitial) {
          return CenterCircularWidget();
        } else if (state is RecordFetchedState) {
          return state.data.isEmpty
              ? const Text("No Records Found")
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      var item = state.data[index];
                      return Card(
                        child: Column(children: [
                          rowItems("First Name", item.firstName),
                          rowItems("Last Name", item.lastName),
                          rowItems("Email", item.email),
                        ]),
                      );
                    },
                  ),
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget rowItems(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
