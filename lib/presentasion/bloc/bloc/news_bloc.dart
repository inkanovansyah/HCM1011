import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/model/news.dart';
import '../../../data/service/ApiRepo.dart';
import 'dart:convert';
import 'dart:developer'; // Diperlukan untuk mencetak respons JSON
import 'package:flutter/services.dart'; // Untuk log

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Network _apiRepository = Network();

  NewsBloc() : super(NewsInitial()) {
    on<GetNewsList>((event, emit) async {
      // Tambahkan async di sini
      await _mapGetNewsListToState(event, emit); // Tambahkan await di sini
    });
  }

  Future<void> _mapGetNewsListToState(
      // Tambahkan Future<void> di sini
      GetNewsList event,
      Emitter<NewsState> emit) async {
    try {
      final mList = await _apiRepository.login(); // Mengambil data dari sumber
      log(jsonEncode(mList.toJson()),
          name: 'Data Loaded'); // Log data yang diambil

      if (mList.error != null) {
        emit(NewsError(mList.error));
        log('Error: ${mList.error}', name: 'Error');
      } else {
        emit(NewsLoaded(mList));
      }
    } catch (e) {
      if (e is NetworkError) {
        emit(NewsError("Failed to fetch data. Is your device online?"));
        log('Network Error: Failed to fetch data. Is your device online?',
            name: 'Error');
      } else {
        emit(NewsError("An error occurred: $e"));
        log('Error: An error occurred: $e', name: 'Error');
      }
    }
  }
}
