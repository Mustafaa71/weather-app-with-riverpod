import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_learning/components/card_content.dart';
import 'package:st_learning/components/reusable_card.dart';
import 'package:st_learning/provider/data.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = Data();
    final dateProvider = ref.watch(date.dateProvider);
    final weatherApi = ref.watch(weatherProvider('abha'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dateProvider),
          ReusableCard(
            cardChild: weatherApi.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => CardContent(
                title: 'Error',
                result: error.toString(),
              ),
              data: (response) => CardContent(
                title: 'City Name',
                result: response.cityName,
              ),
            ),
          ),
          ReusableCard(
            cardChild: weatherApi.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => CardContent(
                title: 'Error',
                result: error.toString(),
              ),
              data: (response) => CardContent(
                title: 'Weather Description',
                result: response.description,
              ),
            ),
          ),
          ReusableCard(
            cardChild: weatherApi.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => CardContent(
                title: 'Error',
                result: error.toString(),
              ),
              data: (response) => CardContent(
                title: 'Temperature',
                result: '${response.temperature}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
