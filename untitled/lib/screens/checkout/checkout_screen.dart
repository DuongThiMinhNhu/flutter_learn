import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/checkout/checkout_bloc.dart';
import 'package:untitled/widgets/custom_appbar.dart';
import 'package:untitled/widgets/custom_navbar.dart';
import 'package:untitled/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: 'Checkout',
        ),
        bottomNavigationBar: CustomNavBar(
          screen: routeName,
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CUSTOMER INFORMATION',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(email: value));}, context, 'Email'),
                      _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));}, context, 'Full Name'),
                      Text(
                        'DELIVERY INFORMATION',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _buildTextFormField(
                              (value){context.read<CheckoutBloc>().add(UpdateCheckout(address: value));}, context, 'Address'),
                      _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(city: value));}, context, 'City'),
                      _buildTextFormField(
                              (value){context.read<CheckoutBloc>().add(UpdateCheckout(country: value));}, context, 'Country'),
                      _buildTextFormField(
                              (value){context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));}, context, 'Zip code'),
                      Text(
                        'ORDER INFORMATION',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      OrderSummary(),
                    ],
                  );
                }
                if (state is CheckoutSuccess) {
                  return Center(
                    child: Text('Success!!'),
                  );
                }
                if (state is CheckoutLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  return Text('Something went wrong');
                }
              },
            )));
  }

  Padding _buildTextFormField(
      Function(String) ? onChanged,
      BuildContext context,
      String lableText) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              lableText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
                onChanged: onChanged,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          )),
        ],
      ),
    );
  }
}
