import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_page_widget.dart' show NotePageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class NotePageModel extends FlutterFlowModel<NotePageWidget> {
  ///  Local state fields for this page.

  bool emotionChosen = false;

  bool thoughtsRecordingStarted = false;

  bool thoughtsRecordingCompleted = false;

  EmotionsRecord? emotion;

  bool eventAudioPlaing = false;

  bool emotionAudioPlaing = false;

  bool throughAudioPlaing = false;

  ///  State fields for stateful widgets in this page.

  AudioRecorder? audioRecorder1;
  String? eventAudio;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in Image widget.
  ApiCallResponse? eventTranscription;
  // State field(s) for EventTimer widget.
  int eventTimerMilliseconds = 20000;
  String eventTimerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController eventTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? eventAudioTimer;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in EventTimer widget.
  ApiCallResponse? eventTranscription1;
  AudioPlayer? soundPlayer1;
  AudioRecorder? audioRecorder2;
  String? throughtAudio;
  FFUploadedFile recordedFileBytes3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in Image widget.
  ApiCallResponse? troughtsTranscription;
  // State field(s) for TroughtTimer widget.
  int troughtTimerMilliseconds = 20000;
  String troughtTimerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController troughtTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? throughtAudioTimer;
  FFUploadedFile recordedFileBytes4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in TroughtTimer widget.
  ApiCallResponse? troughtsTranscription1;
  AudioPlayer? soundPlayer2;
  AudioRecorder? audioRecorder3;
  String? emotionAudio;
  FFUploadedFile recordedFileBytes5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in Image widget.
  ApiCallResponse? emotionTranscription;
  // State field(s) for EmotionTimer widget.
  int emotionTimerMilliseconds = 20000;
  String emotionTimerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController emotionTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? emotionAudioTimer;
  FFUploadedFile recordedFileBytes6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (SpeechToText)] action in EmotionTimer widget.
  ApiCallResponse? emotionTranscription1;
  AudioPlayer? soundPlayer3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eventTimerController.dispose();
    troughtTimerController.dispose();
    emotionTimerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
