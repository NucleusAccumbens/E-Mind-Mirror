import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'note_page_model.dart';
export 'note_page_model.dart';

class NotePageWidget extends StatefulWidget {
  const NotePageWidget({super.key});

  @override
  State<NotePageWidget> createState() => _NotePageWidgetState();
}

class _NotePageWidgetState extends State<NotePageWidget> {
  late NotePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (dateTimeFormat('yMMMd', getCurrentTimestamp) !=
          dateTimeFormat('yMMMd', FFAppState().recordingDate)) {
        setState(() {
          FFAppState().noteAded = false;
          FFAppState().note = NoteStruct();
          FFAppState().eventRecordingStarted = false;
          FFAppState().eventRecordingCompleted = false;
          FFAppState().emotionsRecordingStarted = false;
          FFAppState().emotionsRecordingCompleted = false;
          FFAppState().emotionChosen = false;
          FFAppState().thoughtsRecordingStarted = false;
          FFAppState().thoughtsRecordingCompleted = false;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 71.0, 0.0, 0.0),
            child: Text(
              'Express your feelings and emotions ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Colors.black,
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 86.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Press the record button',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.black,
                        fontSize: 28.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'and start talking   ',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                            fontSize: 28.0,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 38.0),
            child: Container(
              width: double.infinity,
              height: 420.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().eventRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF64BE7D),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Complete 1/4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().eventRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.radio_button_off_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Describe an event or situation',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().eventRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'What happened with you\ntoday?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              if (FFAppState().eventRecordingStarted == false &&
                                  FFAppState().eventRecordingCompleted == false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().eventRecordingStarted =
                                            true;
                                      });
                                      _model.eventTimerController
                                          .onStartTimer();
                                      _model.audioRecorder1 ??= AudioRecorder();
                                      if (await _model.audioRecorder1!
                                          .hasPermission()) {
                                        final String path;
                                        final AudioEncoder encoder;
                                        if (kIsWeb) {
                                          path = '';
                                          encoder = AudioEncoder.opus;
                                        } else {
                                          final dir =
                                              await getApplicationDocumentsDirectory();
                                          path =
                                              '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
                                          encoder = AudioEncoder.aacLc;
                                        }
                                        await _model.audioRecorder1!.start(
                                          RecordConfig(encoder: encoder),
                                          path: path,
                                        );
                                      } else {
                                        showSnackbar(
                                          context,
                                          'You have not provided permission to record audio.',
                                        );
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Start_Recording.png',
                                        width: 54.0,
                                        height: 54.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().eventRecordingStarted == true &&
                                  FFAppState().eventRecordingCompleted == false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().eventRecordingCompleted =
                                              true;
                                        });
                                        _model.eventAudio =
                                            await _model.audioRecorder1?.stop();
                                        if (_model.eventAudio != null) {
                                          _model.recordedFileBytes1 =
                                              FFUploadedFile(
                                            name: 'recordedFileBytes1.mp3',
                                            bytes:
                                                await XFile(_model.eventAudio!)
                                                    .readAsBytes(),
                                          );
                                        }

                                        _model.eventTimerController
                                            .onStopTimer();
                                        setState(() {
                                          FFAppState().eventAudio =
                                              _model.eventAudio!;
                                        });
                                        _model.eventTranscription =
                                            await SpeechToTextCall.call(
                                          file: _model.recordedFileBytes1,
                                        );
                                        if ((_model.eventTranscription
                                                ?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().updateNoteStruct(
                                              (e) => e
                                                ..createdTime =
                                                    getCurrentTimestamp
                                                ..situation = getJsonField(
                                                  (_model.eventTranscription
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.text''',
                                                ).toString(),
                                            );
                                            FFAppState().recordingDate =
                                                getCurrentTimestamp;
                                          });
                                        }

                                        setState(() {});
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Pause.png',
                                          width: 54.0,
                                          height: 54.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.eventTimerMilliseconds,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller:
                                              _model.eventTimerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.eventTimerMilliseconds =
                                                value;
                                            _model.eventTimerValue =
                                                displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            setState(() {
                                              FFAppState()
                                                      .eventRecordingCompleted =
                                                  true;
                                            });
                                            _model.eventAudioTimer =
                                                await _model.audioRecorder1
                                                    ?.stop();
                                            if (_model.eventAudioTimer !=
                                                null) {
                                              _model.recordedFileBytes2 =
                                                  FFUploadedFile(
                                                name: 'recordedFileBytes2.mp3',
                                                bytes: await XFile(
                                                        _model.eventAudioTimer!)
                                                    .readAsBytes(),
                                              );
                                            }

                                            setState(() {
                                              FFAppState().eventAudio =
                                                  _model.eventAudioTimer!;
                                            });
                                            _model.eventTranscription1 =
                                                await SpeechToTextCall.call(
                                              file: _model.recordedFileBytes2,
                                            );
                                            if ((_model.eventTranscription1
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().updateNoteStruct(
                                                  (e) => e
                                                    ..createdTime =
                                                        getCurrentTimestamp
                                                    ..situation = getJsonField(
                                                      (_model.eventTranscription1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.text''',
                                                    ).toString(),
                                                );
                                                FFAppState().recordingDate =
                                                    getCurrentTimestamp;
                                              });
                                            }

                                            setState(() {});
                                          },
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (FFAppState().eventRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What happened with you\ntoday?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (!_model.eventAudioPlaing)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.eventAudioPlaing = true;
                                    });
                                    _model.soundPlayer1 ??= AudioPlayer();
                                    if (_model.soundPlayer1!.playing) {
                                      await _model.soundPlayer1!.stop();
                                    }
                                    _model.soundPlayer1!.setVolume(1.0);
                                    await _model.soundPlayer1!
                                        .setUrl(FFAppState().eventAudio)
                                        .then(
                                            (_) => _model.soundPlayer1!.play());

                                    setState(() {
                                      _model.eventAudioPlaing = false;
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Play.png',
                                      width: 54.0,
                                      height: 54.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (_model.eventAudioPlaing)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.soundPlayer1?.stop();
                                    setState(() {
                                      _model.eventAudioPlaing = false;
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Pause.png',
                                      width: 54.0,
                                      height: 54.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().thoughtsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF64BE7D),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Complete 2/4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().thoughtsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.radio_button_off_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Share your thoughts and reflections',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().thoughtsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'What thoughts do you\nhave about this event?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              if (FFAppState().thoughtsRecordingStarted ==
                                      false &&
                                  FFAppState().thoughtsRecordingCompleted ==
                                      false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().thoughtsRecordingStarted =
                                            true;
                                      });
                                      _model.troughtTimerController
                                          .onStartTimer();
                                      _model.audioRecorder2 ??= AudioRecorder();
                                      if (await _model.audioRecorder2!
                                          .hasPermission()) {
                                        final String path;
                                        final AudioEncoder encoder;
                                        if (kIsWeb) {
                                          path = '';
                                          encoder = AudioEncoder.opus;
                                        } else {
                                          final dir =
                                              await getApplicationDocumentsDirectory();
                                          path =
                                              '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
                                          encoder = AudioEncoder.aacLc;
                                        }
                                        await _model.audioRecorder2!.start(
                                          RecordConfig(encoder: encoder),
                                          path: path,
                                        );
                                      } else {
                                        showSnackbar(
                                          context,
                                          'You have not provided permission to record audio.',
                                        );
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Start_Recording.png',
                                        width: 54.0,
                                        height: 54.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().thoughtsRecordingStarted ==
                                      true &&
                                  FFAppState().thoughtsRecordingCompleted ==
                                      false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState()
                                              .thoughtsRecordingStarted = false;
                                          FFAppState()
                                                  .thoughtsRecordingCompleted =
                                              true;
                                        });
                                        _model.troughtTimerController
                                            .onStopTimer();
                                        _model.throughtAudio =
                                            await _model.audioRecorder2?.stop();
                                        if (_model.throughtAudio != null) {
                                          _model.recordedFileBytes3 =
                                              FFUploadedFile(
                                            name: 'recordedFileBytes3.mp3',
                                            bytes: await XFile(
                                                    _model.throughtAudio!)
                                                .readAsBytes(),
                                          );
                                        }

                                        setState(() {
                                          FFAppState().thoughtsAudio =
                                              _model.throughtAudio!;
                                        });
                                        _model.troughtsTranscription =
                                            await SpeechToTextCall.call(
                                          file: _model.recordedFileBytes3,
                                        );
                                        if ((_model.troughtsTranscription
                                                ?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().updateNoteStruct(
                                              (e) => e
                                                ..thoughts = getJsonField(
                                                  (_model.troughtsTranscription
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.text''',
                                                ).toString(),
                                            );
                                            FFAppState().recordingDate =
                                                getCurrentTimestamp;
                                          });
                                        }

                                        setState(() {});
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Pause.png',
                                          width: 54.0,
                                          height: 54.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.troughtTimerMilliseconds,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller:
                                              _model.troughtTimerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.troughtTimerMilliseconds =
                                                value;
                                            _model.troughtTimerValue =
                                                displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            setState(() {
                                              FFAppState()
                                                      .thoughtsRecordingStarted =
                                                  false;
                                              FFAppState()
                                                      .thoughtsRecordingCompleted =
                                                  true;
                                            });
                                            _model.throughtAudioTimer =
                                                await _model.audioRecorder2
                                                    ?.stop();
                                            if (_model.throughtAudioTimer !=
                                                null) {
                                              _model.recordedFileBytes4 =
                                                  FFUploadedFile(
                                                name: 'recordedFileBytes4.mp3',
                                                bytes: await XFile(_model
                                                        .throughtAudioTimer!)
                                                    .readAsBytes(),
                                              );
                                            }

                                            setState(() {
                                              FFAppState().thoughtsAudio =
                                                  _model.throughtAudioTimer!;
                                            });
                                            _model.troughtsTranscription1 =
                                                await SpeechToTextCall.call(
                                              file: _model.recordedFileBytes4,
                                            );
                                            if ((_model.troughtsTranscription1
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().updateNoteStruct(
                                                  (e) => e
                                                    ..thoughts = getJsonField(
                                                      (_model.eventTranscription1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.text''',
                                                    ).toString(),
                                                );
                                                FFAppState().recordingDate =
                                                    getCurrentTimestamp;
                                              });
                                            }

                                            setState(() {});
                                          },
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (FFAppState().thoughtsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'What thoughts do you\nhave about this event?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              if (!_model.throughAudioPlaing)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.soundPlayer2 ??= AudioPlayer();
                                      if (_model.soundPlayer2!.playing) {
                                        await _model.soundPlayer2!.stop();
                                      }
                                      _model.soundPlayer2!.setVolume(1.0);
                                      _model.soundPlayer2!
                                          .setUrl(FFAppState().thoughtsAudio)
                                          .then((_) =>
                                              _model.soundPlayer2!.play());

                                      setState(() {
                                        _model.throughAudioPlaing = true;
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Play.png',
                                        width: 54.0,
                                        height: 54.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.throughAudioPlaing)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.soundPlayer2?.stop();
                                      setState(() {
                                        _model.throughAudioPlaing = false;
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Pause.png',
                                        width: 54.0,
                                        height: 54.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().emotionChosen)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF64BE7D),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Complete 3/4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().emotionChosen)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.radio_button_off_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Select the prevailing emotion',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().emotionChosen)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 12.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: StreamBuilder<List<EmotionsRecord>>(
                              stream: queryEmotionsRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EmotionsRecord>
                                    listViewEmotionsRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewEmotionsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEmotionsRecord =
                                        listViewEmotionsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          setState(() {
                                            FFAppState().emotionChosen = true;
                                            FFAppState().emotion =
                                                EmotionStruct(
                                              name: listViewEmotionsRecord.name,
                                              hexColor: listViewEmotionsRecord
                                                  .hexColor,
                                              textHexColor:
                                                  listViewEmotionsRecord
                                                      .textHexColor,
                                            );
                                          });
                                          setState(() {
                                            FFAppState().updateNoteStruct(
                                              (e) => e
                                                ..emotion = EmotionStruct(
                                                  name: listViewEmotionsRecord
                                                      .name,
                                                  hexColor:
                                                      listViewEmotionsRecord
                                                          .hexColor,
                                                  textHexColor:
                                                      listViewEmotionsRecord
                                                          .textHexColor,
                                                ),
                                            );
                                            FFAppState().recordingDate =
                                                getCurrentTimestamp;
                                          });
                                        },
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: colorFromCssString(
                                              listViewEmotionsRecord.hexColor,
                                              defaultColor: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              listViewEmotionsRecord.name,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: colorFromCssString(
                                                      listViewEmotionsRecord
                                                          .textHexColor,
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      if (FFAppState().emotionChosen)
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 16.0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: colorFromCssString(
                                  FFAppState().emotion.hexColor,
                                  defaultColor: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  FFAppState().emotion.name,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: colorFromCssString(
                                          FFAppState().emotion.textHexColor,
                                          defaultColor: Colors.black,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().emotionsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF64BE7D),
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Complete 4/4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().emotionsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.radio_button_off_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Describe the emotions you experienced',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!FFAppState().emotionsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'How do you feel in this\nsituation?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              if (FFAppState().emotionsRecordingStarted ==
                                      false &&
                                  FFAppState().emotionsRecordingCompleted ==
                                      false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().emotionsRecordingStarted =
                                            true;
                                      });
                                      _model.emotionTimerController
                                          .onStartTimer();
                                      _model.audioRecorder3 ??= AudioRecorder();
                                      if (await _model.audioRecorder3!
                                          .hasPermission()) {
                                        final String path;
                                        final AudioEncoder encoder;
                                        if (kIsWeb) {
                                          path = '';
                                          encoder = AudioEncoder.opus;
                                        } else {
                                          final dir =
                                              await getApplicationDocumentsDirectory();
                                          path =
                                              '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
                                          encoder = AudioEncoder.aacLc;
                                        }
                                        await _model.audioRecorder3!.start(
                                          RecordConfig(encoder: encoder),
                                          path: path,
                                        );
                                      } else {
                                        showSnackbar(
                                          context,
                                          'You have not provided permission to record audio.',
                                        );
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Start_Recording.png',
                                        width: 54.0,
                                        height: 54.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState().emotionsRecordingStarted ==
                                      true &&
                                  FFAppState().emotionsRecordingCompleted ==
                                      false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.emotionAudio =
                                            await _model.audioRecorder3?.stop();
                                        if (_model.emotionAudio != null) {
                                          _model.recordedFileBytes5 =
                                              FFUploadedFile(
                                            name: 'recordedFileBytes5.mp3',
                                            bytes: await XFile(
                                                    _model.emotionAudio!)
                                                .readAsBytes(),
                                          );
                                        }

                                        setState(() {
                                          FFAppState()
                                              .emotionsRecordingStarted = false;
                                          FFAppState()
                                                  .emotionsRecordingCompleted =
                                              true;
                                        });
                                        _model.emotionTimerController
                                            .onStopTimer();
                                        setState(() {
                                          FFAppState().emotionsAudio =
                                              _model.emotionAudio!;
                                        });
                                        _model.emotionTranscription =
                                            await SpeechToTextCall.call(
                                          file: _model.recordedFileBytes5,
                                        );
                                        if ((_model.emotionTranscription
                                                ?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().updateNoteStruct(
                                              (e) => e
                                                ..emotions = getJsonField(
                                                  (_model.emotionTranscription
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.text''',
                                                ).toString(),
                                            );
                                            FFAppState().recordingDate =
                                                getCurrentTimestamp;
                                          });
                                        }

                                        setState(() {});
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Pause.png',
                                          width: 54.0,
                                          height: 54.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.emotionTimerMilliseconds,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller:
                                              _model.emotionTimerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.emotionTimerMilliseconds =
                                                value;
                                            _model.emotionTimerValue =
                                                displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          onEnded: () async {
                                            setState(() {
                                              FFAppState()
                                                      .emotionsRecordingStarted =
                                                  false;
                                              FFAppState()
                                                      .emotionsRecordingCompleted =
                                                  true;
                                            });
                                            _model.emotionAudioTimer =
                                                await _model.audioRecorder3
                                                    ?.stop();
                                            if (_model.emotionAudioTimer !=
                                                null) {
                                              _model.recordedFileBytes6 =
                                                  FFUploadedFile(
                                                name: 'recordedFileBytes6.mp3',
                                                bytes: await XFile(_model
                                                        .emotionAudioTimer!)
                                                    .readAsBytes(),
                                              );
                                            }

                                            setState(() {
                                              FFAppState().emotionsAudio =
                                                  _model.emotionAudioTimer!;
                                            });
                                            _model.emotionTranscription1 =
                                                await SpeechToTextCall.call(
                                              file: _model.recordedFileBytes6,
                                            );
                                            if ((_model.emotionTranscription1
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().updateNoteStruct(
                                                  (e) => e
                                                    ..emotions = getJsonField(
                                                      (_model.emotionTranscription1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.text''',
                                                    ).toString(),
                                                );
                                                FFAppState().recordingDate =
                                                    getCurrentTimestamp;
                                              });
                                            }

                                            setState(() {});
                                          },
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (FFAppState().emotionsRecordingCompleted)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'How do you feel in this\nsituation?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (!_model.emotionAudioPlaing)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.emotionAudioPlaing = true;
                                    });
                                    _model.soundPlayer3 ??= AudioPlayer();
                                    if (_model.soundPlayer3!.playing) {
                                      await _model.soundPlayer3!.stop();
                                    }
                                    _model.soundPlayer3!.setVolume(1.0);
                                    await _model.soundPlayer3!
                                        .setUrl(FFAppState().emotionsAudio)
                                        .then(
                                            (_) => _model.soundPlayer3!.play());

                                    setState(() {
                                      _model.emotionAudioPlaing = false;
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Play.png',
                                      width: 54.0,
                                      height: 54.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (_model.emotionAudioPlaing)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.soundPlayer3?.stop();
                                    setState(() {
                                      _model.emotionAudioPlaing = false;
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Pause.png',
                                      width: 54.0,
                                      height: 54.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 114.0,
              decoration: const BoxDecoration(
                color: Color(0xEB000000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'CBT Thought Diary',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Jost',
                          color: const Color(0xCDFFFFFF),
                          fontSize: 16.0,
                        ),
                  ),
                  Container(
                    width: 78.0,
                    height: 24.0,
                    decoration: const BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Bubble.png',
                            width: 30.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().noteAded) {
                              context.goNamed(
                                'CalendarPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              setState(() {
                                FFAppState().addToNotes(NoteStruct());
                                FFAppState().noteAded = true;
                              });

                              context.goNamed(
                                'CalendarPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.solidCalendarAlt,
                            color: Color(0xCDFFFFFF),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
