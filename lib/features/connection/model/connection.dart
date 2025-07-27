import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  ConnectionService._();
  static final ConnectionService _instance = ConnectionService._();
  static ConnectionService get instance => _instance;

  final Connectivity _connectivity = Connectivity();
  late StreamController<bool> _connectionController;
  late Stream<bool> _connectionStream;

  bool _isInitialized = false;

  /// Get the connection status stream
  Stream<bool> get connectionStream {
    if (!_isInitialized) {
      _initializeStream();
    }
    return _connectionStream;
  }

  void _initializeStream() {
    _connectionController = StreamController<bool>.broadcast();
    _connectionStream = _connectionController.stream;

    // Check initial connectivity and add to stream
    _checkInitialConnectivity();

    // Listen to connectivity changes
    _connectivity.onConnectivityChanged.listen(
      (result) {
        final isConnected = _isConnected(result);
        if (!_connectionController.isClosed) {
          _connectionController.add(isConnected);
        }
      },
      onError: (error) {
        if (!_connectionController.isClosed) {
          _connectionController.add(false);
        }
      },
    );

    _isInitialized = true;
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      final isConnected = _isConnected(result);
      if (!_connectionController.isClosed) {
        _connectionController.add(isConnected);
      }
    } catch (e) {
      if (!_connectionController.isClosed) {
        _connectionController.add(false);
      }
    }
  }

  /// Check if there's any network connection available
  bool _isConnected(List<ConnectivityResult> result) => result.any(
    (connectivity) =>
        connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.mobile,
  );

  /// Dispose the stream controller
  void dispose() {
    if (_isInitialized && !_connectionController.isClosed) {
      _connectionController.close();
    }
    _isInitialized = false;
  }
}
