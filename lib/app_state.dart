import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _emotionsAudio = prefs.getString('ff_emotionsAudio') ?? _emotionsAudio;
    });
    _safeInit(() {
      _thoughtsAudio = prefs.getString('ff_thoughtsAudio') ?? _thoughtsAudio;
    });
    _safeInit(() {
      _eventRecordingStarted =
          prefs.getBool('ff_eventRecordingStarted') ?? _eventRecordingStarted;
    });
    _safeInit(() {
      _eventRecordingCompleted = prefs.getBool('ff_eventRecordingCompleted') ??
          _eventRecordingCompleted;
    });
    _safeInit(() {
      _emotionsRecordingStarted =
          prefs.getBool('ff_emotionsRecordingStarted') ??
              _emotionsRecordingStarted;
    });
    _safeInit(() {
      _emotionsRecordingCompleted =
          prefs.getBool('ff_emotionsRecordingCompleted') ??
              _emotionsRecordingCompleted;
    });
    _safeInit(() {
      _emotionChosen = prefs.getBool('ff_emotionChosen') ?? _emotionChosen;
    });
    _safeInit(() {
      _thoughtsRecordingStarted =
          prefs.getBool('ff_thoughtsRecordingStarted') ??
              _thoughtsRecordingStarted;
    });
    _safeInit(() {
      _thoughtsRecordingCompleted =
          prefs.getBool('ff_thoughtsRecordingCompleted') ??
              _thoughtsRecordingCompleted;
    });
    _safeInit(() {
      _eventAudio = prefs.getString('ff_eventAudio') ?? _eventAudio;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_emotion')) {
        try {
          final serializedData = prefs.getString('ff_emotion') ?? '{}';
          _emotion =
              EmotionStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _recordingDate = prefs.containsKey('ff_recordingDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_recordingDate')!)
          : _recordingDate;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_note')) {
        try {
          final serializedData = prefs.getString('ff_note') ?? '{}';
          _note = NoteStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _notes = prefs
              .getStringList('ff_notes')
              ?.map((x) {
                try {
                  return NoteStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _notes;
    });
    _safeInit(() {
      _noteAded = prefs.getBool('ff_noteAded') ?? _noteAded;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _emotionsAudio = '';
  String get emotionsAudio => _emotionsAudio;
  set emotionsAudio(String value) {
    _emotionsAudio = value;
    prefs.setString('ff_emotionsAudio', value);
  }

  String _thoughtsAudio = '';
  String get thoughtsAudio => _thoughtsAudio;
  set thoughtsAudio(String value) {
    _thoughtsAudio = value;
    prefs.setString('ff_thoughtsAudio', value);
  }

  bool _eventRecordingStarted = false;
  bool get eventRecordingStarted => _eventRecordingStarted;
  set eventRecordingStarted(bool value) {
    _eventRecordingStarted = value;
    prefs.setBool('ff_eventRecordingStarted', value);
  }

  bool _eventRecordingCompleted = false;
  bool get eventRecordingCompleted => _eventRecordingCompleted;
  set eventRecordingCompleted(bool value) {
    _eventRecordingCompleted = value;
    prefs.setBool('ff_eventRecordingCompleted', value);
  }

  bool _emotionsRecordingStarted = false;
  bool get emotionsRecordingStarted => _emotionsRecordingStarted;
  set emotionsRecordingStarted(bool value) {
    _emotionsRecordingStarted = value;
    prefs.setBool('ff_emotionsRecordingStarted', value);
  }

  bool _emotionsRecordingCompleted = false;
  bool get emotionsRecordingCompleted => _emotionsRecordingCompleted;
  set emotionsRecordingCompleted(bool value) {
    _emotionsRecordingCompleted = value;
    prefs.setBool('ff_emotionsRecordingCompleted', value);
  }

  bool _emotionChosen = false;
  bool get emotionChosen => _emotionChosen;
  set emotionChosen(bool value) {
    _emotionChosen = value;
    prefs.setBool('ff_emotionChosen', value);
  }

  bool _thoughtsRecordingStarted = false;
  bool get thoughtsRecordingStarted => _thoughtsRecordingStarted;
  set thoughtsRecordingStarted(bool value) {
    _thoughtsRecordingStarted = value;
    prefs.setBool('ff_thoughtsRecordingStarted', value);
  }

  bool _thoughtsRecordingCompleted = false;
  bool get thoughtsRecordingCompleted => _thoughtsRecordingCompleted;
  set thoughtsRecordingCompleted(bool value) {
    _thoughtsRecordingCompleted = value;
    prefs.setBool('ff_thoughtsRecordingCompleted', value);
  }

  String _eventAudio = '';
  String get eventAudio => _eventAudio;
  set eventAudio(String value) {
    _eventAudio = value;
    prefs.setString('ff_eventAudio', value);
  }

  EmotionStruct _emotion = EmotionStruct();
  EmotionStruct get emotion => _emotion;
  set emotion(EmotionStruct value) {
    _emotion = value;
    prefs.setString('ff_emotion', value.serialize());
  }

  void updateEmotionStruct(Function(EmotionStruct) updateFn) {
    updateFn(_emotion);
    prefs.setString('ff_emotion', _emotion.serialize());
  }

  DateTime? _recordingDate = DateTime.fromMillisecondsSinceEpoch(1708516260000);
  DateTime? get recordingDate => _recordingDate;
  set recordingDate(DateTime? value) {
    _recordingDate = value;
    value != null
        ? prefs.setInt('ff_recordingDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_recordingDate');
  }

  NoteStruct _note = NoteStruct();
  NoteStruct get note => _note;
  set note(NoteStruct value) {
    _note = value;
    prefs.setString('ff_note', value.serialize());
  }

  void updateNoteStruct(Function(NoteStruct) updateFn) {
    updateFn(_note);
    prefs.setString('ff_note', _note.serialize());
  }

  List<NoteStruct> _notes = [];
  List<NoteStruct> get notes => _notes;
  set notes(List<NoteStruct> value) {
    _notes = value;
    prefs.setStringList('ff_notes', value.map((x) => x.serialize()).toList());
  }

  void addToNotes(NoteStruct value) {
    _notes.add(value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeFromNotes(NoteStruct value) {
    _notes.remove(value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNotes(int index) {
    _notes.removeAt(index);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void updateNotesAtIndex(
    int index,
    NoteStruct Function(NoteStruct) updateFn,
  ) {
    _notes[index] = updateFn(_notes[index]);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNotes(int index, NoteStruct value) {
    _notes.insert(index, value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  bool _noteAded = false;
  bool get noteAded => _noteAded;
  set noteAded(bool value) {
    _noteAded = value;
    prefs.setBool('ff_noteAded', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
